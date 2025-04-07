{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    (texlive.combine {
      inherit (texlive) scheme-small latexmk
        cjk cjk-ko nanumtype1 kotex-plain kotex-utf kotex-utils
        kotex-oblivoir xpatch
        multirow lipsum;
    })
  ];
}
