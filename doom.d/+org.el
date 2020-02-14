;;; ~/.dotfiles/doom.d/+org.el -*- lexical-binding: t; -*-


(setq org-agenda-files (list "~/org"))
(after! org
  (setq org-startup-with-inline-images t)
  (setq org-latex-pdf-process
        '("xelatex -interaction nonstopmode -output-directory %o %f"
          "xelatex -interaction nonstopmode -output-directory %o %f"
          "xelatex -interaction nonstopmode -output-directory %o %f"))
  (setq org-plantuml-jar-path (expand-file-name "~/tools/plantuml.jar")))


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
        :n "SPC \\" #'org-insert-subheading))
