self: super: {
  obsidian = super.obsidian.overrideAttrs (old: {
    postFixup =
      (old.postFixup or "")
      + ''
        if [ -x "$out/bin/obsidian" ]; then
            wrapProgram $out/bin/obsidian \
              --add-flags "--ozone-platform=x11"
          fi
      '';
  });
}
