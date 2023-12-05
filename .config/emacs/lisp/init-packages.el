(require 'package)

(setq package-archives '(("gnu"    . "http://mirrors.bfsu.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.bfsu.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.bfsu.edu.cn/elpa/melpa/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(package-install 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)
(setq use-package-always-defer t)

(use-package restart-emacs
  :ensure t)

(provide 'init-packages)
