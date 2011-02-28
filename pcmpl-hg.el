;;; pcmpl-hg.el --- pcomplete for hg

;; Copyright (C) 2011  myuhe

;; Author: myuhe 
;; Keywords: tools, Mercurial

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Complete both hg commands and their options and arguments. Type
;; '-' to complete short options and '--' to complete long options.

;;; Code:

(require 'pcomplete)

(defvar pcmpl-hg-toplevel-options
  '("--config"
    "--cwd"
    "--debug"
    "--debugger"
    "--encoding"
    "--encodingmode"
    "--help"
    "--lsprof"
    "--noninteractive"                      
    "--profile"
    "--quiet"
    "--repositry"
    "--time"
    "--traceback"
    "--verbose"
    "--version"
    ))

(defvar pcmpl-hg-opt
  '(
    ("add" . (("-I" "-X" "-S" "-n")
              ("--include"
               "--exclude"
               "--subrepos"
               "--dry-run"
               "--mq")))
    ("addremove" . (("-s" "-I" "-X" "-n" )
                    ("--similarity"
                     "--include"
                     "--exclude"
                     "--dry-run"
                     "--mq")))
    ("anotate" . (("-r" "-a" "-u" "-d" "-n" "-c" "-l" "-I" "-X")
                  ("--rev"
                   "--no-follow"
                   "--text"
                   "--user"
                   "--file"
                   "--date"
                   "--number"
                   "--changeset"
                   "--line-number"
                   "--include"
                   "--exclude")))
    ("archive" . (("-p" "-r" "-t" "-S" "-I" "-X")
                  ("--prefix"
                   "--rev"
                   "--type"
                   "--subrepos"
                   "--include"
                   "--exclude"
                   "--mq")))

    ("backout" . (("-t" "-r" "-I" "-X" "-m" "-l" "-d" "-u")
                  ("--tool"
                   "--rev"
                   "--include"
                   "--exclude"
                   "--message"
                   "--logfile"
                   "--date"
                   "--user"
                   "--mq")))

    ("bisect" . (("-r" "-g" "-b" "-s" "-c" "-U")
                 ("--reser"
                  "--good"
                  "--bad"
                  "--skip"
                  "--command"
                  "--noupdate"
                  "--mq")))

    ("branch" . (("-f" "-C")
                 ("--force"
                  "--clean"
                  "--mq")))

    ("branches" . (("-a-" "-c")
                   ("--active"
                    "--closed"
                    "--mq")))

    ("bundle" . (("-f" "-r" "-b" "-a" "-t" "-e")
                 ("--force"
                  "--rev"
                  "--branch"
                  "--base"
                  "--all"
                  "--type"
                  "--ssh"
                  "--remotecmd"
                  "--insecure"
                  "--mq")))

    ("cat" . (("-o" "-r" "-I" "-X")
              ("--output"
               "--rev"
               "--decode"
               "--include"
               "--exclude"
               "--mq")))

    ("clone" . (("-U" "-u" "-r" "-b" "-e")
                ("--noupdate"
                 "--updaterev"
                 "--rev"
                 "--branch"
                 "--pull"
                 "--uncompressed"
                 "--ssh"
                 "--remotecmd"
                 "insecure")))

    ("commit" . (("-A" "-I" "-X" "-m" "-l" "-d" "-u")
                 ("--addremove"
                  "--close-branch"
                  "--include"
                  "--exclude" 
                  "--message"
                  "--logfile" 
                  "--date"
                  "--user"
                  "--mq")))

    ("copy" . (("-n" "-X" "-I" "-f" "-A") 
               ("--after"
                "--force"
                "--include"
                "--exclude"
                "--dry-run"
                "--mq")))

    ("diff" . (("-S" "-X" "-I" "-U" "-B" "-b" "-w" "-p" "-g" "-a" "-c" "-r") 
               ("--rev"
                "--change"
                "--text"
                "--git" 
                "--nodates"
                "--show-function" 
                "--reverse"
                "--ignore-all-space"
                "--ignore-space-change"
                "--ignore-blank-lines"
                "--unified"
                "--stat"
                "--include"
                "--exclude"
                "-'subrepos"
                "--mq")))

    ("export" . (("-g" "-a" "-r" "-o") 
                 ("--output"
                  "--switch-parent"
                  "--rev"
                  "--text"
                  "--git"
                  "--nodates"
                  "--mq")))

    ("forget" . (("-X" "-I")
                 ("--include"
                  "--exclude"
                  "--mq")))

    ("grep" . (("-X" "-I" "-d" "-u" "-r" "-n" "-l" "-i" "-f" "-0") 
               ("--print0"
                "--follow"
                "--ignore-case"
                "--file-with-matches"
                "--line-number"
                "--rev"
                "--user"
                "--date"
                "--include"
                "--exclude"
                "--mq")))

    ("heads" . (("-e")
                ("--insecure"
                 "--ssh"
                 "--remotecmd"
                 "--mq")))

    ("help" . (("-e")
               ("--insecure"
                "--ssh"
                "--remotecmd"
                "--mq")))

    ("identify" . (("-t" "-b" "-i" "-n" "-r") 
                   ("--rev"
                    "--num"
                    "--id"
                    "--branch"
                    "--tags"
                    "--mq")))

    ("import" . (("-s" "-u" "-d" "-l" "-m" "-f" "-b" "-p") 
                 ("--strip"
                  "--base"
                  "--force"
                  "--no-commit"
                  "--exact"
                  "--import-branch"
                  "--message"
                  "--logfile"
                  "--date"
                  "--user"
                  "--similarity"
                  "--mq")))

    ("incoming" . (("-S" "-e" "-M" "-l" "-g" "-p" "-b" "-r" "-n" "-f") 
                   ("--force"
                    "--newest-first"
                    "--bundle"
                    "--rev"
                    "--branch"
                    "--patch"
                    "--git"
                    "--limit"
                    "--no-merge"
                    "--stat"
                    "--style"
                    "--template"
                    "--ssh"
                    "--remotesmd"
                    "--insecure"
                    "--subrepos"
                    "--mq")))

    ("init" . (("-e")
               ("--ssh"
                "--remotecmd"
                "--insecure"
                "--mq")))

    ("locate" . (("-X" "-I" "-f" "-0" "-r")
                 ("--rev"
                  "--print0"
                  "--fullpath"
                  "--include"
                  "--exclude"
                  "--mq")))

    ("log" . (("-X" "-I" "-M" "-l" "-g" "-p" "-P" "-b" "-u" "-m" "-r" "-k" "-C" "-d" "-f")
              ("--follow"
               "--follow-first"
               "--date"
               "--copies"
               "--keyword"
               "--rev"
               "--removed"
               "--only-merges"
               "--user"
               "--branch"
               "-prune"
               "--patch"
               "--git"
               "--limit"
               "--no-merges"
               "--stat"
               "--style"
               "--template"
               "--include"
               "--exclude"
               "--mq")))

    ("manifest" . (("-r")
                   ("--rev"
                    "--mq")))

    ("merge"    . (("-P" "-r" "-t" "-f")
                   ("--force"
                    "--tool"
                    "--rev"
                    "--preview"
                    "--mq")))

    ("outgoing" . (("-S" "-e" "-M" "-l" "-g" "-p" "-b" "-n" "-r" "-f") 
                   ("--force"
                    "--rev"
                    "--newest-first"
                    "--branch"
                    "--patch"
                    "--git"
                    "--limit"
                    "--no-merges"
                    "--stat"
                    "--style"
                    "--templates"
                    "--ssh"
                    "--remotecmd"
                    "--insecure"
                    "--subrepos"
                    "--mq")))

    ("parents" . (("-r")
                  ("--rev"
                   "--stle"
                   "--templates"
                   "--mq")))

    ("paths" . (nil 
                ("--mq")))

    ("pull"     . (("-e" "-b" "-r" "-f" "-u")
                   ("--update"
                    "--force"
                    "--rev"
                    "--branch"
                    "--ssh"
                    "--remotecmd"
                    "--insecure"
                    "--mq")))

    ("push"     . (("-e" "-b" "-r" "-f")
                   ("--insecure"
                    "--ssh"
                    "--remotecmd"
                    "--mq")))

    ("qapplied" . (("-s" "-l") 
                   ("--last"
                    "--summary")))
    
("qclone" . (("-e" "-p" "-U")
                 ("--pull"
                  "--noupdate"
                  "--uncompressed"
                  "--patches"
                  "--ssh"
                  "--remotecmd"
                  "--insecure")))

    ("qdelete" . (("-k")
                  ("--keep")))

    ("qdiff"    . (("-X" "-I" "-U" "-B" "-b" "-w" "-p" "-g" "-a")
                   ("--text"
                    "--git"
                    "--nodates"
                    "--show-function"
                    "--reverse"
                    "--ignore-all-space"
                    "--ignore-space-change"
                    "--ignore-blank-lines"
                    "--unified"
                    "--stat"
                    "--include"
                    "--exclude")))
    ("qfinish" . (("-a")("--applied")))
    ("qfold" . (("-l" "-m" "-k" "-e")
                ("--edit"
                 "--keep"
                 "--message"
                 "--logfile")))
    ("qgoto" . (("-f")
                ("--force")))
    ("qguard" . (("-n" "-l") 
                 ("--list"
                  "--none")))
    ("qheader" . (nil nil))
    ("qimport" . (("-P" "-g" "-r" "-f" "-n" "-e") 
                  ("--existing"
                   "--name"
                   "--force"
                   "--rev"
                   "--git"
                   "--push")))

    ("qnew"     . (("-l" "-m" "-X" "-I" "-d" "-D" "-u" "-U" "-g" "-e")
                   ("--edit"
                    "--git"
                    "--currentuser"
                    "--user"
                    "--currentdate"
                    "--date"
                    "--include"
                    "--exclude"
                    "--message"
                    "--logfile")))
    ("qnext" . (("-s")
                ("--summary")))

    ("qpop"     . (("-f" "-a")
                   ("--all"
                    "--force")))
    ("qprev" . (("-s")
                ("--summary")))
    ("qpush"    . (("-a" "-l" "-f")
                   ("--force"
                    "--list"
                    "--all"
                    "--move")))
    ("qqueue" . (("-c" "-l")
                 ("--list"
                  "--create"
                  "--rename"
                  "--delete"
                  "--purge")))

    ("qrefresh" . (("-l" "-m" "-X" "-I" "-d" "-D" "-u" "-U" "-s" "-g" "-e")
                   ("--edit"
                    "--git"
                    "--short"
                    "--currentuser"
                    "--user"
                    "--currentdate"
                    "--date"
                    "--include"
                    "--execlude"
                    "--message"
                    "--logfile")))
    ("qrename" . (nil nil))
    ("qselect" . (("-s" "-n") 
                  ("--none"
                   "--series"
                   "--pop"
                   "--reapply")))

    ("qseries" . (("-s" "-m")
                  ("--missing"
                   "--summary")))

    ("qtop" . (("-s")
               ("--summary")))

    ("qunapplied" . (("-s" "-l")
                     ("--first"
                      "--summary")))
    ("strip" . (("-k" "-n" "-f")
                ("--force"
                 "--no-backup"
                 "--keep")))

    ("recover" . (nil 
                  ("--mq")))

    ("remove" . (("-X" "-I" "-f" "-A")
                 ("--after"
                  "--force"
                  "--include"
                  "--execlude")))
    
    ("rename" . (("-n" "-X" "-I" "-f" "-A") 
                 ("--after"
                  "--force"
                  "--include"
                  "--exclude"
                  "--dry-run"
                  "--mq")))

    ("resolve" . (("-X" "-I" "-n" "-t" "-u" "-m" "-l" "-a") 
                  ("--all"
                   "--list"
                   "--unmark"
                   "--tool"
                   "no-status"
                   "--include"
                   "--exclude"
                   "--mq")))

    ("revert" . (("-n" "-X" "-I" "-r" "-d" "-a")
                 ("--all"
                  "--date"
                  "--rev"
                  "--no-backup"
                  "--include"
                  "--exclude"
                  "--dry-run"
                  "--mq")))

    ("rollback" . (("-n") 
                   ("--dry-run"
                    "--mq")))

    ("root" . (nil
               ("--mq")))

    ("serve"  . (("-6" "-t" "-n" "-a" "-p" "-E" "-d" "-A")
                 ("--accesslog"
                  "--daemon"
                  "--daemon-pipefds"
                  "--errorlog"
                  "--port"
                  "--address"
                  "--prefix"
                  "--name"
                  "--web-conf"
                  "--pid-file"
                  "--stdio"
                  "--templates"
                  "--style"
                  "--ipv6"
                  "--certificate"
                  "--mq")))

    ("showconfig" . (("-u") 
                     ("--untrusted"
                      "--mq")))

    ("status" . (("-0" "-C" "-n" "-i" "-u" "-c" "-d" "-r" "-a" "-m" "-A")
                 ("--all"
                  "--modified"
                  "--added"
                  "--removed"
                  "--deleted"
                  "--clean"
                  "--unknown"
                  "--ignored"
                  "--no-status"
                  "--copies"
                  "--print0"
                  "--rev"
                  "--change"
                  "--include"
                  "--execlude"
                  "--subrepos"
                  "--mq")))

    ("summary" . (nil 
                  ("--remote"
                   "--mq")))

    ("tag" . (("-u" "-d" "-m" "-e" "-r" "-l" "-f") 
              ("--force"
               "--local"
               "--rev"
               "--remove"
               "--edit"
               "--message"
               "--date"
               "--user"
               "--mq")))

    ("tip" . (("-g" "-p") 
              ("--patch"
               "--git"
               "--style"
               "--templates"
               "--mq")))

    ("unbundle" . (("-u") 
                   ("--update"
                    "--mq")))

    ("update" . (("-r" "-d" "-c" "-C") 
                 ("--clean"
                  "--check"
                  "--date"
                  "--rev"
                  "--mq")))

    ("verify" . (nil 
                 ("--mq")))

    ("version" . (nil nil))
    ))

(defun pcmpl-hg-short-options (cmd)
  (cadr (assoc cmd pcmpl-hg-opt)))

(defun pcmpl-hg-long-options (cmd)
  (caddr (assoc cmd pcmpl-hg-opt)))

;;;###autoload
(defun pcomplete/hg ()
  "Completion rules for the `hg' command."
  (let* ((cmd (nth 1 pcomplete-args)) 
         (soptions (pcmpl-hg-short-options cmd))
         (loptions (pcmpl-hg-long-options cmd)))
    (if (pcomplete-match "^-" 0)
        (pcomplete-here pcmpl-hg-toplevel-options)
      (pcomplete-here (mapcar 'car pcmpl-hg-opt)))
    (dolist (opt (mapcar 'car pcmpl-hg-opt))
      (when (string= cmd opt)
        (cond
         ((pcomplete-match "^--" 0)
          (pcomplete-here loptions))
         ((pcomplete-match "^-" 0)
          (pcomplete-here soptions)))))))

(provide 'pcmpl-hg)
