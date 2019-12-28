;;; ~/.dotfiles/doom.d/+org.el -*- lexical-binding: t; -*-


(setq org-agenda-files (list "~/org"))
(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))
(setq org-plantuml-jar-path (expand-file-name "~/tools/plantuml.jar"))
(setq org-startup-with-inline-images t)


(use-package! ox-hugo
  :after ox)

;; blog
(defun deploy-my-blog ()
  "Deploy my already generated markdown files to blog site."
  (interactive)
  (async-shell-command "~/Desktop/blog/deploy.sh"))

(map! :map org-mode-map
      :n "SPC \\" #'org-insert-subheading)
