(defprotocol TempoCalculator
	(tempo [this message-time1 message-time2]))
	
(defrecord MidiTempoCalculator [ppq mt1 mt2]
	TempoCalculator
	(tempo [this mt1 mt2] (/ 60000 (* (- mt2 mt1) ppq)))
)

; of course there are easier ways to do the same thing:

(defn tempo2 [ppq mt1 mt2] (/ 60000 (* (- mt2 mt1) ppq)))
(def ppq 24)
(tempo2 ppq 0 20.83333333)