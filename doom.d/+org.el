;;; ~/.dotfiles/doom.d/+org.el -*- lexical-binding: t; -*-


(setq org-directory "~/org/"
      org-agenda-files '("~/org"))

(after! org
  (setq org-startup-with-inline-images t
        org-bullets-bullet-list '("~" ">" "!" "+")
        org-ellipsis "…"
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
  )

(after! org
  (map! :map org-mode-map
        :ni [C-M-return] (lambda (arg) (interactive "P") (org-insert-subheading arg)
                           (evil-append 0))))
