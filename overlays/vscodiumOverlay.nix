self: super: {
  vscodium = super.vscodium.overrideAttrs (old: {
    postFixup =
      (old.postFixup or "")
      + ''
        if [ -x "$out/bin/vscodium" ]; then
            wrapProgram $out/bin/vscodium \
              --add-flags "--ozone-platform=x11"
          fi
      '';
  });
}
