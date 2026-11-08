$lualatex = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape -pvc -pdf %O %S';
$pdf_mode = 4;

# Indirizza i file di output (PDF) e ausiliari nelle rispettive directory
$aux_dir = 'aux';

# Previene gli errori di I/O ricreando l'albero delle directory ausiliarie
$make_local_dirs = 1;

ensure_path( 'TEXINPUTS', './packages//' );