;;; ~/.dotfiles/doom.d/+org.el -*- lexical-binding: t; -*-

(setq org-directory "~/Share/org"
      org-agenda-files '("~/Share/org")
      org-default-notes-file "~/Share/org/inbox.org")

(after! org
  (defun find-month-tree ()
    (org-datetree-find-date-create (calendar-current-date))
    (kill-line))
  (setq org-capture-templates
        '(("t" "Personal todo" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* TODO %^{Task}\n%u\n%a")
          ("n" "Personal notes" entry
           (file+headline +org-capture-notes-file "Inbox")
           "* %u %^{Title} %t %^g\n %?\n")
          ("j" "Journal" entry
           (file+olp+datetree +org-capture-journal-file)
           "* %U %^{Title}\n %?")
          ("b" "Billing" plain
           (file+function "billing.org" find-month-tree)
           " | %U | %^{类别} | %^{描述} | %^{金额} |")))
  (setq org-roam-capture-templates
        '(
          ("d" "default" plain (function org-roam-capture--get-point)
           "%?"
           :file-name "%<%Y%m%d%H%M%S>-${slug}"
           :head "#+title: ${title}\n#+roam_alias:\n#+roam_tags: \n\n")
          ("p" "Paper Note" plain (function org-roam-capture--get-point)
           "* 相关工作\n\n%?\n* 观点\n\n* 模型和方法\n\n* 实验\n\n* 结论\n"
           :file-name "%<%Y%m%d%H%M%S>-${slug}"
           :head "#+title: ${title}\n#+roam_alias:\n#+roam_tags: \n\n"
           :unnarrowed t)))
  (setq org-roam-capture-immediate-template
        '("d" "default" plain (function org-roam-capture--get-point)
          "%?"
          :file-name "%<%Y%m%d%H%M%S>-${slug}"
          :head "#+title: ${title}\n"
          :unnarrowed t))
  (setq org-roam-capture-ref-templates
        '(("r" "ref" plain (function org-roam-capture--get-point)
           ""
           :file-name "${slug}"
           :head "#+title: ${title}\n#+roam_key: ${ref}\n"
           :unnarrowed t)
          ("a" "Annotation" plain (function org-roam-capture--get-point)
           "%U ${body}\n"
           :file-name "${slug}"
           :head "#+title: ${title}\n#+roam_key: ${ref}\n#+roam_alias:\n"
           :immediate-finish t
           :unnarrowed t)))
  (setq org-startup-with-inline-images t
        org-ellipsis "..."
        org-superstar-headline-bullets-list '("•")
        org-latex-pdf-process '("xelatex -interaction nonstopmode -output-directory %o %f"
                                "xelatex -interaction nonstopmode -output-directory %o %f"
                                "xelatex -interaction nonstopmode -output-directory %o %f")
        org-plantuml-jar-path (expand-file-name "~/tools/plantuml.jar")))


;; blog
(after! org
  (defun deploy-my-blog ()
    "Deploy my already generated markdown files to blog site."
    (interactive)
    (async-shell-command "~/blog/deploy.sh"))

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

(remove-hook! '(text-mode-hook) #'display-line-numbers-mode)
(add-hook! org-mode (mixed-pitch-mode 1))
(add-hook! org-mode (hl-line-mode -1))
(add-hook! org-mode (defun valign () (require 'valign) (valign-mode)))

(use-package! org-roam-server
  :after org-roam
  :init
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 9090
        org-roam-server-export-inline-images t
        org-roam-server-authenticate nil)
  :config
  (org-roam-server-mode)
  (defun org-roam-server-open ()
    (interactive)
    (browse-url (format "http://%s:%d" org-roam-server-host org-roam-server-port)))
  )
