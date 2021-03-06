;L1 : 3.
;a)Write a function that inserts in a linear list a given atom A after the 
;  2nd, 4th, 6th, ... element.

;insertA(l1...ln, index, a) = [], n = 0
;                             l1 U insertA(l2...ln, index+1, a), index%2 =1
;                             l1 U a U insert(l2...ln, index+1), otherwise

;insertAMain(l1...ln, a) = insertA(l1...ln, 1, a)

(defun insertA ( l i a)
  (cond 
   ((null l) nil)
   ((equal 1 (mod i 2)) (cons (car l) (insertA (cdr l) (+ i 1) a)))
   ( t                    (cons (car l) (cons a (insertA (cdr l) (+ i 1) a))))
  )
)

(defun insertAMain ( l a)
  (insertA l 1 a)
)


;b) Write a function to get from a given list the list of all atoms, on any level,
; but reverse order. Example:(((A B) C) (D E)) ==> (E D C B A)

; getAtoms(l1..ln)= l1, 11 atom
;                   getAtoms(l1) U getAtoms(l2...ln) , l1 is a list
;                   l1 U getAtoms(l2...ln) , otherwise

; getAtomsMain(l1...ln) = reverse(getAtoms(l))

(defun getAtoms ( l)
  (cond   
   ((null l) nil)
   ((listp (car l))  (append (getAtoms (car l)) (getAtoms (cdr l))))
   ( t  	     (cons   (car l)            (getAtoms (cdr l))))
  )
)

(defun getAtomsMain (l)
  (reverse (getAtoms l))
)


;c) Write a function that returns the greatest common divisor of all numbers in a 
;nonlinear list.

;gcd2(a b) =  a, b=0
;             gcd2(b, a%b), otherwise

;GrComDiv(l1...ln, d) = d, n=0
;                      GrComDiv(l2..ln, gcd2(l1, d)), otherwise

;GrComDivMain(l1...ln) = [], n=0
;                        GrComDiv(getAtoms(l2...ln), getAtoms(l1)), otherwise
                         
(defun gcd2(a b)
  (if (= b 0) a 
    (gcd2 b (mod a b))
  )
)

(defun GrComDiv (l d)
  (cond     
   ((null l)  d)
   ( t       (GrComDiv (cdr l) (gcd2 (car l) d)))
  )
)

(defun GrComDivMain (l)
  (setf l (getAtoms l))
  (cond ((null l) nil))
  (GrComDiv l (car l))
)


;d) Write a function that determines the number of occurrences of a given atom in a nonlinear list.

; nrOcc (l1..ln, e, o) = o, n=0
;                        nrOcc(l2..ln, e, o+1), e=l1
;                        nrOcc(l2..ln, e, o), otherwise

;nrOccMain(l1...ln, e) = nrOcc(getAtoms(l1...ln), e, 0)

(defun nrOcc (l e o)
  (cond
   ((null l) o)
   ((= e (car l)) (nrOcc (cdr l) e (+ o 1)) )
   ( t            (nrOcc (cdr l) e o)  )
  )
)

(defun nrOccMain (l e)
  (setf l (getAtoms l))
  (nrOcc (getAtoms l) e 0)
)