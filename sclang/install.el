;;; install --- Configure SuperCollider in EMACS

;;; Commentary:

;; Add load path for loading sclang.
;; require sclang
;; Add load path for SuperCollider executables
;; To try this out:
;; First on shell (ssh):
;; cd ~/
;; git clone git@github.com:iani/pimacsc.git
;; Then in emacs:
;; (load-file "/home/pi/pimacsc/sclang/install.el")

;;; Code:
(let* ((scemacs-root (file-truename "~/.local/share/SuperCollider/Extensions/scemacs"))
       (sclang-root (file-name-directory load-file-name)))
  (make-directory (file-name-directory scemacs-root) t)
  (sleep-for 0.5)
  (unless (file-exists-p scemacs-root)
    (make-symbolic-link
     (concat (file-name-directory sclang-root) "scemacs")
     scemacs-root))
  (add-to-list 'load-path sclang-root)
  (add-to-list 'exec-path "/usr/local/bin/"))

(require 'sclang)
(message "SuperCollider installed on EMACS")
(provide 'install)
;;; install.el ends here
