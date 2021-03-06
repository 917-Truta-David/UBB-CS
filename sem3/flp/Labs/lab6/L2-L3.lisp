;L2 : 1. For a given tree of type (1) return the path from the root node to acertain
; given nodeX.


; path(l1...ln, g, p1..pm) =
;     p1...pm, g=p1
;     path(l3..ln, g, l1 U p1...pm), l2 = 1
;     path(path(l3..ln,g,l1 U p1..pm),g, l1 U p1..pm), path(l3..ln,g,l1 U p1..pm)=
;                                                                           0 or 1 or 2
;                                                                               and l2 = 2
;    l1...ln, l2 = 2 AND path(l3..ln, g, l1 U p1..pm)!= 0 and 1 and 2
;    l3..ln, otherwise


; pathMain(l-list of subtrees ,g - node goal) = reverse(path(l1...ln, g, []))

;Test: (pathMain '(A 2 B 2 D 2 H 0 I 0 E 0 C 2 F 0 G 1 J 1) 'J) --> (A C G J)

(defun path (l g p)
  (setf p (cons (car l) p))
  (cond
   ((eq  g (car p))                                    p)
   ((eq (car (cdr l)) 1 )      (path (cdr (cdr l)) g p) )
   ((eq (car (cdr l)) 2 )    
    (setf l (path (cdr (cdr l)) g p))
    (cond 
     ((eq (car (cdr l)) 1)  (path l g p))
     ((eq (car (cdr l)) 2)  (path l g p))
     ((eq (car (cdr l)) 0)  (path l g p))
     (t                                l)
    )
   )
   (t                                             (cdr (cdr l)))
  )
  

)

(defun pathMain (l g)
  (reverse (path l g nil))
)

;L3 : 15. Write a function that reverses a list together with all its sublists elements,
;  at any level.

; invers(l1..ln) = [], n=0
;                  append(invers(l2...ln), list(l1)), l1 is an atom
;                  append(invers(l2...ln), list(invers(l1))), otherwise
;

; Test : (INVERS '(A (B C (D (E))) (F G))) = (G F E D C B A)

(DEFUN INVERS (L)
  (COND
   ((NULL L) NIL)
   ((ATOM (CAR L)) (APPEND (INVERS (CDR L)) (LIST (CAR L))))
   ( T             (APPEND (INVERS (CDR L)) (LIST(INVERS (CAR L)))))
  )
)
