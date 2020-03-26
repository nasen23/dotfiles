;;; ~/.dotfiles/doom.d/+org.el -*- lexical-binding: t; -*-


(setq org-directory "~/org/"
      org-agenda-files '("~/org"))

(after! org
  (setq org-startup-with-inline-images t
        org-ellipsis "⤵"
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

  )

(after! org
  (map! :map org-mode-map
        :ni [C-M-return] (lambda (arg) (interactive "P") (org-insert-subheading arg)
                           (evil-append 0))))
