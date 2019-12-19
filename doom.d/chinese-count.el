;;; ~/.dotfiles/doom.d/chinese-count.el -*- lexical-binding: t; -*-

(defvar word-count-rule-chinese "\\cc"
  "A regexp string to match chinese characters.")

(defvar word-count-rule-nonespace "[^[:space:]]")

(defvar word-count-rule-ansci "[A-Za-z]")


(defun regexp-words-count (start end regexp)
  (let ((count 0))
    (save-excursion
      (goto-char start)
      (while (and (< (point) end) (re-search-forward regexp end t))
        (setq count (1+ count))))
    count))

(defun my/chinese-word-count (&optional beg end)
  "Chinese word count."
  (interactive (list (mark) (point)))
  (let ((min (if (= beg end) (point-min) beg))
        (max (if (= beg end) (point-max) end))
        list)
    (setq list
          (mapcar (lambda (r)
                    (regexp-words-count min max r))
                  (list
                   word-count-rule-chinese
                   word-count-rule-nonespace
                   word-count-rule-ansci
                   )))
    (message "字数:%d,字符数（不计空格）:%d,字符数（计空格）:%d,非中文单词:%d,中文:%d"
             (+ (car list) (car (last list)))
             (cadr list)
             (- max min)
             (car (last list))
             (car list))))

