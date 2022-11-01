(lang dune 3.3)

(name cw-ddd-challenge)

(generate_opam_files true)

(source (github lmdexpr/cw-ddd-challenge))

(authors "Yuki Tajiri")

(maintainers "Yuki Tajiri <lmdexpr@gmail.com>")

(license MIT)

(package
 (name cw-ddd-challenge)
 (synopsis "DDD challenge")
 (depends
   (ocaml (>= 5.0.0))
   ocamlformat
   ocaml-lsp-server
   dune))
