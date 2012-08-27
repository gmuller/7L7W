(defn big 
	"Test if a string is bigger than a number" 
	[st n] 
	(> (count st) n)
)

(def collection-map {
	clojure.lang.PersistentArrayMap :map
	clojure.lang.PersistentList :list 
	clojure.lang.PersistentVector :vector
	clojure.lang.PersistentHashSet :set
	}
)

(defn collection-type 
	[col]
	(collection-map (class col))
)