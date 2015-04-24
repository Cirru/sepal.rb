
lasgn a :1
lasgn b 1

call nil p (lvar a)

defn p2 (args x)
  call nil p (lvar x)

call nil p2 :demo

call nil p
  call (call 1 + 2) + 3

