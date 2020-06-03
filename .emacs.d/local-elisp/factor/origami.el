(provide 'factor/origami)

(use-package origami
  :bind (("C-." . origami-toggle-node)
         ("C->" . origami-recursively-toggle-node)
         ("C-," . origami-toggle-all-nodes)
         )
)
