; START:protocol
(defprotocol Compass
  (direction [c])
  (left [c])
  (right [c]))
; END:protocol

; START:directions
(def directions [:north :east :south :west])
; END:directions

; START:turn
(defn turn
  [base amount]
  (rem (+ base amount) (count directions)))
; END:turn

; START:defrecord
(defrecord SimpleCompass [bearing]
  Compass

  (direction [_] (directions bearing))

  (left [_] (SimpleCompass. (turn bearing 3)))
  (right [_] (SimpleCompass. (turn bearing 1)))

  Object
  (toString [this] (str "[" (direction this) "]"))
 )

