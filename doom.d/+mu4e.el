;;; ~/.dotfiles/doom.d/+mu4e.el -*- lexical-binding: t; -*-

(setq mail-user-agent 'mu4e-user-agent)
(setq mu4e-maildir "~/.mail")
(setq mu4e-get-mail-command "offlineimap -u quiet")
(setq mu4e-update-interval 300)

(setq mu4e-view-show-images t)

(after! mu4e
  (setq mu4e-contexts
        `( ,(make-mu4e-context
             :name "netease"
             :enter-func (lambda () (mu4e-message "Switch to the netease context"))
             :match-func (lambda (msg)
                           (when msg
                             (mu4e-message-maildir-matches msg "^/netease")))
             :leave-func (lambda () (mu4e-clear-caches))
             :vars '((user-mail-address            . "nasen2582995949@163.com")
                     (user-full-name               . "Sen Na")
                     ;; (smtpmail-default-smtp-server . "smtp.office365.com")
                     ;; (smtpmail-smtp-server         . "smtp.office365.com")
                     ;; (smtpmail-smtp-service        . 587)
                     ;; (smtpmail-stream-type         . starttls)
                     (mu4e-compose-signature       .
                                                   '("Sen Na\n"))))
           ,(make-mu4e-context
             :name "tsinghua"
             :enter-func (lambda () (mu4e-message "Switch to the tsinghua context"))
             :match-func (lambda (msg)
                           (when msg
                             (mu4e-message-maildir-matches msg "^/tsinghua")))
             :leave-func (lambda () (mu4e-clear-caches))
             :vars '((user-mail-address            . "ns17@mails.tsinghua.edu.cn")
                     (user-full-name               . "Sen Na")
                     ;; (smtpmail-default-smtp-server . "smtp.qq.com")
                     ;; (smtpmail-smtp-server         . "smtp.qq.com")
                     ;; ;;(smtpmail-auth-credentials    . '(("smtp.qq.com" 587 "tiedang.yang@foxmail.com" nil)))
                     ;; (smtpmail-smtp-service        . 587)
                     ;; (smtpmail-stream-type         . ssl)
                     (mu4e-compose-signature       .
                                                   '("Sen Na\n"))))))

  )
