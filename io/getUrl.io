futureResult := URL with("http://grantmuller.com/") @fetch
writeln("Getting google.com...")

writeln("Blocking until it arrives")
writeln("fetched ", futureResult size, " bytes")