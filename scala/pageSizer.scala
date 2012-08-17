import scala.io.Source
import scala.xml._
import scala.actors._
import Actor._

object PageLoader {
	def load(url: String) = {
    try {
      Source.fromURL(url).mkString
    } catch {
      case e: Exception => System.err.println(e)
      ""
    }
  }
	val linkPattern = "(?i)<a.+?href=\"(http.+?)\".*?>(.+?)</a>".r
	def getPageSize(url: String) = load(url).length
	def getLinks(url: String) : List[Any] = linkPattern.findAllIn(load(url)).toList
}

val urls = List(//"http://www.google.com",
				//"http://www.audiocookbook.com",
				"http://grantmuller.com")

def timeMethod(method: () => Unit) = {
	val start = System.nanoTime
	method()
	val end = System.nanoTime
	println("Method took " + (end - start)/1000000000.0 + " seconds.")
}
	
def getPageSizeSequentially() = {
	for (url <- urls) {
		println("Size for " + url + ": " + PageLoader.getPageSize(url))
	}
}
	
def getPageSizeConcurrently() = {
	val caller = self
	for (url <- urls) {
		actor { caller ! (url, PageLoader.getPageSize(url)) }
	}
	
	for(i <- 1 to urls.size) {
		receive {
			case (url, size) => println("Size for " + url + ": " + size)
		}
	}
}

def getLinks() = {
	val caller = self
	for (url <- urls) {
		actor { caller ! (url, PageLoader.getLinks(url)) }
	}
	
	for(i <- 1 to urls.size) {
		receive {
			case (url: String, links: List[Any]) => {
				val sizeCollector = self
				println("Num Links for " +  url + ": " + links.size)
				links.foreach(link => {
					val href = XML.loadString(link.toString) \ "@href"
					actor { sizeCollector ! ((href, PageLoader.getPageSize(href.toString))) }
				})
				
				var totalSize = 0
				for (i <- 1 to links.length) {
					receive {
						case (url, size: Int) => { 
							println("Size for " + url + ": " + size)
							totalSize += size
						}
					}
				}
				println(totalSize)
			}
		}
	}
}
timeMethod { getLinks }
