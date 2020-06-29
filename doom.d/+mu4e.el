;;; ~/.dotfiles/doom.d/+mu4e.el -*- lexical-binding: t; -*-

(set-email-account! "i"
  '((smtpmail-smtp-user . "i@nasen.xyz")
    (smtpmail-smtp-server . "smtp.mail.ru")
    (smtpmail-stream-type . ssl)
    (smtpmail-smtp-service . 465)
    (user-mail-address  . "i@nasen.xyz")) t)
(set-email-account! "netease"
  '((smtpmail-smtp-user . "nasen2582995949@163.com")
    (smtpmail-smtp-server . "smtp.163.com")
    (smtpmail-stream-type . ssl)
    (smtpmail-smtp-service . 465)
    (user-mail-address  . "nasen2582995949@163.com")) t)
(set-email-account! "tsinghua"
  '((smtpmail-smtp-user . "ns17@mails.tsinghua.edu.cn")
    (smtpmail-smtp-server . "mails.tsinghua.edu.cn")
    (smtpmail-stream-type . ssl)
    (smtpmail-smtp-service . 465)
    (user-mail-address  . "ns17@mails.tsinghua.edu.cn")) t)

(after! mu4e
  (setq +mu4e-backend 'offlineimap)
  (setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it)
  (setq mail-user-agent 'mu4e-user-agent)
  (setq mu4e-maildir "~/.mail")
  (setq mu4e-update-interval 600)

  (setq mu4e-view-show-images t)
  (setq message-sendmail-envelope-from 'header)
  )

(add-hook! 'after-init-hook #'mu4e-alert-enable-notifications)
(after! doom-modeline
  (mu4e-alert-enable-mode-line-display))
