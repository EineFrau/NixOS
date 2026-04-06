self: super: {
  vscodium = super.vscodium.overrideAttrs (old: {
    postFixup =
      (old.postFixup or "")
      + ''
        if [ -x "$out/bin/codium" ]; then
            wrapProgram $out/bin/codium \
              --add-flags "--ozone-platform=x11"
          fi
      '';
  });
}
