(define (inst-defvars inst-defs)
  ; define variables
  (for-each (lambda (x)
              (set!  
                (list-ref x 0)
                (list-ref x 1)))
            inst-defs ))

(define (inst-definckeys inst-defs #!optional kawapad)
  (if kawapad
    (let* ((link (lambda(x y)
                   (kawapad:textual-increment:add-incremental-symbol (car x) (car y)))))
      (let ((last-elem #f))
        (for-each (lambda (curr-elem)
                    (if last-elem
                      ;then
                      (link last-elem curr-elem)
                      ;else
                      )
                    (set! last-elem curr-elem)) 
                  inst-defs)
        (link (last inst-defs ) (first inst-defs))))))

(define (inst-init inst-defs)
  (if (defined? kawapad)
    (inst-definckeys inst-defs kawapad))
  (inst-defvars inst-defs ))

