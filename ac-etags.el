;;; ac-etags.el --- etags completion source for auto-complete

;; Copyright (C) 2013 by Syohei YOSHIDA

;; Author: Syohei YOSHIDA <syohex@gmail.com>
;; URL: https://github.com/syohex/emacs-ac-etags
;; Version: 0.01

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; `ac-etags.el' is etags completion source for auto-complete.

;; Sample configuration
;;
;; If you change `requires' auto-complete source attribute
;;   (custom-set-variable
;;     '(ac-etags-requires 1))
;;
;;   (eval-after-load "etags"
;;     '(progn
;;         (ac-etags-setup)))

;;; Code:

(require 'auto-complete)
(require 'etags)

(defgroup ac-etags nil
  "Auto completion with etags"
  :group 'auto-complete)

(defcustom ac-etags-requires 3
  "Minimum input for starting completion"
  :type 'integer
  :group 'ac-etags)

(defface ac-etags-candidate-face
  '((t (:inherit ac-candidate-face :foreground "navy")))
  "Face for etags candidate"
  :group 'auto-complete)

(defface ac-etags-selection-face
  '((t (:inherit ac-selection-face :background "navy")))
  "Face for the etags selected candidate."
  :group 'auto-complete)

(defun ac-etags-candidate ()
  (ignore-errors
    (when tags-table-list
      (all-completions ac-prefix (tags-completion-table)))))

;;;###autoload
(defun ac-etags-setup ()
  (interactive)

  (ac-define-source etags
    `((candidates . ac-etags-candidate)
      (candidate-face . ac-etags-candidate-face)
      (selection-face . ac-etags-selection-face)
      (requires . ,ac-etags-requires)
      (symbol . "s"))))

(provide 'ac-etags)

;;; ac-etags.el ends here