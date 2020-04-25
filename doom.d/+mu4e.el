;;; ~/.dotfiles/doom.d/+mu4e.el -*- lexical-binding: t; -*-

(setq +mu4e-backend 'offlineimap)
(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-service 465
      smtpmail-starttls-credentials "~/.authinfo.gpg")

(after! mu4e
  (setq mail-user-agent 'mu4e-user-agent)
  (setq mu4e-maildir "~/.mail")
  (setq mu4e-update-interval 300)

  (setq mu4e-view-show-images t)

  (setq message-sendmail-envelope-from 'header)
  (defun mu4e-message-maildir-matches (msg rx)
    (when rx
      (if (listp rx)
          ;; If rx is a list, try each one for a match
          (or (mu4e-message-maildir-matches msg (car rx))
              (mu4e-message-maildir-matches msg (cdr rx)))
        ;; Not a list, check rx
        (string-match rx (mu4e-message-field msg :maildir)))))

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
                     (smtpmail-default-smtp-server . "smtp.163.com")
                     (smtpmail-smtp-server         . "smtp.163.com")
                     (smtpmail-smtp-service        . 465)
                     (smtpmail-stream-type         . ssl)
                     (mu4e-compose-signature       .
                                                   '("Sen Na\n"))))
           ,(make-mu4e-context
             :name "i"
             :enter-func (lambda () (mu4e-message "Switch to the i@nasen context"))
             :match-func (lambda (msg)
                           (when msg
                             (mu4e-message-maildir-matches msg "^/i")))
             :leave-func (lambda () (mu4e-clear-caches))
             :vars '((user-mail-address            . "i@nasen.xyz")
                     (user-full-name               . "Sen Na")
                     (smtpmail-default-smtp-server . "smtp.mail.ru")
                     (smtpmail-smtp-server         . "smtp.main.ru")
                     (smtpmail-smtp-service        . 465)
                     (smtpmail-stream-type         . ssl)
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
                     (smtpmail-default-smtp-server . "mails.tsinghua.edu.cn")
                     (smtpmail-smtp-server . "mails.tsinghua.edu.cn")
                     (smtpmail-smtp-service        . 465)
                     (smtpmail-stream-type         . ssl)
                     (mu4e-compose-signature       .
                                                   '("Sen Na\n"))))))

  )
