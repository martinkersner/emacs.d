;; -*- coding: utf-8; lexical-binding: t; -*-

(clear-abbrev-table global-abbrev-table)

(define-abbrev-table 'global-abbrev-table
  '(
    ("btw" "by the way" )
    ))

;; python specific abbreviations
(when (boundp 'python-mode-abbrev-table)
  (clear-abbrev-table python-mode-abbrev-table))

(define-abbrev-table 'python-mode-abbrev-table
  '(
    ("debug" "from IPython import embed; embed();  # FIXME debugging")
    ))

(set-default 'abbrev-mode t)

(setq save-abbrevs nil)
