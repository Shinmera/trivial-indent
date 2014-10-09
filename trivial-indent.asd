#|
 This file is a part of Trivial-Indent
 (c) 2014 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(defpackage org.tymoonnext.radiance.lib.trivial-indent.asdf
  (:use #:cl #:asdf))
(in-package :org.tymoonnext.radiance.lib.trivial-indent.asdf)

(defsystem trivial-indent
  :name "Trivial-Indent"
  :version "1.0.0"
  :license "Artistic"
  :author "Nicolas Hafner <shinmera@tymoon.eu>"
  :maintainer "Nicolas Hafner <shinmera@tymoon.eu>"
  :description "A very simple library to allow indentation hints for SWANK."
  :long-description ""
  :serial T
  :components ((:file "indent"))
  :depends-on ())
