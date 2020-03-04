;;; ~/.dotfiles/doom.d/+telega.el -*- lexical-binding: t; -*-

(use-package! telega
  :commands (telega)
  :defer t
  :bind ("C-c t" . #'telega)
  :init
  (unless (display-graphic-p) (setq telega-use-images nil))
  :hook
  ('telega-chat-mode . #'yas-minor-mode)
  ('telega-chat-mode . (lambda ()
                         (set-company-backend! 'telega-chat-mode
                           (append '(telega-company-emoji
                                     telega-company-username
                                     telega-company-hashtag)
                                   (when (telega-chat-bot-p telega-chatbuf--chat)
                                     '(telega-company-botcmd))))
                         (company-mode 1)))
  ('telega-chat-pre-message . #'telega-msg-ignore-blocked-sender)
  :config
  ;; for now, just use emacs state inside telega
  ;; I will try to work on integrating with evil-mode in the future
  ;; And try to make root and chat buffer display in a pop-up
  (set-evil-initial-state! '(telega-root-mode telega-chat-mode) 'emacs)

  (setq telega-proxies
        (list '(:server "127.0.0.1" :port 1080 :enable t
                        :type (:@type "proxyTypeSocks5"))))
  (pushnew! telega-known-inline-bots
            "@vid" "@bing" "@wiki" "@imdb")

  (telega-mode-line-mode 1)
  (telega-url-shorten-mode 1)
  (when (and (symbolp 'dbus-runtime-version) (boundp 'dbus-runtime-version))
    (telega-notifications-mode 1))

  (after! all-the-icons
    (add-to-list 'all-the-icons-mode-icon-alist
                 '(telega-root-mode all-the-icons-fileicon "telegram"
                                    :heigt 1.0
                                    :v-adjust -0.2
                                    :face all-the-icons-yellow))
    (add-to-list 'all-the-icons-mode-icon-alist
                 '(telega-chat-mode all-the-icons-fileicon "telegram"
                                    :heigt 1.0
                                    :v-adjust -0.2
                                    :face all-the-icons-blue)))
  )
