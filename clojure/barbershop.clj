(defn new-q [size] (java.util.concurrent.LinkedBlockingQueue. size))

(defn offer! 
  "adds x to the back of queue q"
  [q x] (.offer q x) q)

(defn take! 
  "takes from the front of queue q.  blocks if q is empty"
  [q] (.take q))

(def num-cuts (ref 0))
(def go-on? (atom true))
		
(defn cut-hair	[q]	
(future
   (while @go-on?
     (when-let [item (take! q)]
       (Thread/sleep 20)
       (dosync (alter num-cuts + 1))))))

(defn send-customers [q]
  (future
    (while @go-on? 
      (do
        (Thread/sleep (+ 10 (rand-int 20)))
        (offer! q "Cust")
        ))))
        
(def barbershop (new-q 4))
(dorun (repeatedly 1 #(cut-hair barbershop)))
(send-customers barbershop)
(Thread/sleep (* 10 1000))
(swap! go-on? not)
(println @num-cuts)