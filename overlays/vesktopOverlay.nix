self: super: {
  vesktop = super.vesktop.overrideAttrs (old: {
    postFixup =
      (old.postFixup or "")
      + ''
        if [ -x "$out/bin/vesktop" ]; then
          wrapProgram $out/bin/vesktop \
            --add-flags "--ozone-platform=x11"
        fi
      '';
  });
}
