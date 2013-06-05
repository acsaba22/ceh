(let ((proof-general-hash "qkqsgp619vklk3z2mxhyhm0a5wxi5s8y-ProofGeneral-4.2"))
  (unless (file-exists-p
           (concat "/nix/var/nix/profiles/ceh/emacs/installed_derivations/" proof-general-hash))
    (shell-command "/opt/ceh/emacs.d/proof_general.pl"))
  (load (concat "/nix/store/" proof-general-hash "/share/emacs/site-lisp/site-start.d/pg-init.el"))
  (add-hook 'coq-mode-hook
            (lambda ()
              (define-key coq-mode-map (kbd "<C-S-down>") 'proof-assert-next-command-interactive)
              (define-key coq-mode-map (kbd "<C-S-up>") 'proof-undo-last-successful-command)
              (define-key coq-mode-map (kbd "<C-S-right>") 'proof-goto-point)
              )))
