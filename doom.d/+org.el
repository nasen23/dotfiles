;;; ~/.dotfiles/doom.d/+org.el -*- lexical-binding: t; -*-


(setq org-directory "~/org/"
      org-agenda-files '("~/org"))

(after! org
  (setq org-startup-with-inline-images t
        org-ellipsis "..."
        org-superstar-headline-bullets-list '("•")
        org-latex-pdf-process '("xelatex -interaction nonstopmode -output-directory %o %f"
                                "xelatex -interaction nonstopmode -output-directory %o %f"
                                "xelatex -interaction nonstopmode -output-directory %o %f")
        org-plantuml-jar-path (expand-file-name "~/tools/plantuml.jar")))


(use-package! ox-hugo
  :after ox)

;; blog
(after! org
  (defun deploy-my-blog ()
    "Deploy my already generated markdown files to blog site."
    (interactive)
    (async-shell-command "~/Desktop/blog/deploy.sh"))

  (defun org-insert-clipboard-image ()
    (interactive)
    (setq filename
          (concat
           (make-temp-name
            (concat "./images/"
                    (format-time-string "%Y%m%d_%H%M%S_"))) ".png"))
    (call-process-shell-command (concat "xclip -selection clipboard -t image/png -o > " filename))
    (insert (concat "[[" filename "]]"))
    (org-display-inline-images))

  (map! :map org-mode-map
          :ni [C-M-return] (lambda (arg) (interactive "P") (org-insert-subheading arg)
                            (evil-append 0)))
  )

(add-hook! org-mode #'(mixed-pitch-mode doom/disable-line-numbers))
(add-hook! org-mode (hl-line-mode -1))
(add-hook! org-mode (defun valign () (require 'valign) (valign-mode)))
