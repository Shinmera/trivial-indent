#|
 This file is a part of Trivial-Indent
 (c) 2014 TymoonNET/NexT http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(defpackage #:org.tymoonnext.radiance.lib.trivial-indent
  (:use #:cl)
  (:nicknames #:trivial-indent #:indent)
  (:export
   #:indentation
   #:set-indentation
   #:define-indentation
   #:remove-indentation))

(in-package #:org.tymoonnext.radiance.lib.trivial-indent)

(defvar *indentation-hints* (make-hash-table :test #'eq))

(defun set-indentation (symbol rule-form)
  (setf (gethash symbol *indentation-hints*)
        rule-form))

(defun indentation (symbol)
  (gethash symbol *indentation-hints*))

(defun (setf indentation) (rule-form symbol)
  (set-indentation symbol rule-form))

(defmacro define-indentation (symbol rule-form)
  (assert (symbolp symbol))
  (assert (listp rule-form))
  `(set-indentation ',symbol ',rule-form))

(defun remove-indentation (symbol)
  (remhash symbol *indentation-hints*))

(defun initialize-slime ()
  (when (member "SWANK-INDENTATION" *modules* :test #'string=)
    (let* ((swank (find-package :swank))
           (tables (when swank (find-symbol (string '#:*application-hints-tables*) swank))))
      (when tables
        (set tables (cons *indentation-hints* (remove *indentation-hints* (symbol-value tables))))
        t))))

(initialize-slime)
