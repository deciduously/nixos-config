{ pkgs, inputs, system, ... }: {
  programs.vscode = {
    enable = true;
    #package =
    #  (pkgs.vscode.override {
    #    isInsiders = true;
    #  }).overrideAttrs (oldAttrs: rec {
    #    pname = "vscode-insiders";
    #    src = builtins.fetchTarball {
    #      url = "https://update.code.visualstudio.com/latest/linux-x64/insider";
    #      sha256 = "0d87gkrj75xpssvcg2lyqp9745bca5jl0rx3fxq98gqw9pprghjq";
    #      };
    #  });
    extensions = [
      inputs.fenix.packages.${system}.rust-analyzer-vscode-extension
      pkgs.vscode-extensions.bbenoist.nix
      pkgs.vscode-extensions.esbenp.prettier-vscode
      pkgs.vscode-extensions.justusadam.language-haskell
      pkgs.vscode-extensions.ms-vscode-remote.remote-ssh
      pkgs.vscode-extensions.streetsidesoftware.code-spell-checker
      pkgs.vscode-extensions.vscodevim.vim
    ];
    keybindings = [
      {
        key = "ctrl+alt+e";
        command = "editor.action.marker.prev";
      }
      {
        key = "ctrl+alt+f";
        command = "workbench.action.findInFiles";
      }
      {
        key = "ctrl+alt+h";
        command = "workbench.view.explorer";
      }
      {
        key = "ctrl+alt+s";
        command = "workbench.action.files.saveAll";
      }
      {
        key = "ctrl+alt+w";
        command = "workbench.action.reopenClosedEditor";
      }
      {
        key = "ctrl+q";
        command = "workbench.action.quit";
      }
      {
        key = "ctrl+c";
        command = "editor.action.commentLine";
      }
      {
        key = "ctrl+c";
        command = "editor.action.commentLine";
      }
      {
        key = "ctrl+d";
        command = "editor.action.revealDefinition";
      }
      {
        key = "ctrl+e";
        command = "editor.action.marker.next";
      }
      {
        key = "ctrl+f";
        command = "actions.find";
      }
      {
        key = "ctrl+h";
        command = "workbench.action.previousEditor";
      }
      {
        key = "ctrl+i";
        command = "workbench.action.navigateBack";
      }
      {
        key = "ctrl+l";
        command = "workbench.action.nextEditor";
      }
      {
        key = "ctrl+o";
        command = "workbench.action.navigateForward";
      }
      {
        key = "ctrl+p";
        command = "workbench.action.showCommands";
      }
      {
        key = "ctrl+r";
        command = "editor.action.referenceSearch.trigger";
      }
      {
        key = "ctrl+s";
        command = "workbench.action.files.save";
      }
      {
        key = "ctrl+t";
        command = "workbench.action.quickOpen";
      }
      {
        key = "ctrl+u";
        command = "editor.action.showHover";
      }
      {
        key = "ctrl+w";
        command = "workbench.action.closeActiveEditor";
      }
      {
        key = "ctrl+x";
        command = "editor.action.rename";
      }
      {
        key = "ctrl+x";
        command = "renameFile";
        when = "explorerViewletVisible && filesExplorerFocus && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus";
      }
      {
        key = "ctrl+enter";
        command = "rust-analyzer.run";
      }
    ];
    userSettings = {
      "editor.codeActionsOnSave" = { "source.fixAll" = true; };
      "editor.codeLens" = true;
      "editor.find.cursorMoveOnType" = false;
      "editor.fontSize" = 12;
      "editor.formatOnSave" = true;
      "editor.minimap.enabled" = true;
      "editor.multiCursorModifier" = "ctrlCmd";
      "editor.renderFinalNewline" = false;
      "editor.renderWhitespace" = "all";
      "editor.scrollBeyondLastLine" = false;
      "editor.tabSize" = 2;
      "editor.wordWrap" = "wordWrapColumn";
      "editor.wordWrapColumn" = 100;
      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;
      "extensions.autoCheckUpdates" = true;
      "extensions.ignoreRecommendations" = true;
      "files.insertFinalNewline" = true;
      "files.trimFinalNewlines" = true;
      "files.trimTrailingWhitespace" = true;
      "git.enableCommitSigning" = true;
      "javascript.updateImportsOnFileMove.enabled" = "always";
      "liveshare.showVerboseNotifications" = false;
      "remote.SSH.useLocalServer" = false;
      "rust-analyzer.checkOnSave.command" = "clippy";
      "rust-analyzer.inlayHints.enable" = true;
      "typescript.updateImportsOnFileMove.enabled" = "always";
      "update.mode" = "none";
      "vim.sneak" = true;
      "vim.useSystemClipboard" = true;
      "window.menuBarVisibility" = "toggle";
      "window.zoomLevel" = 1;
      "workbench.activityBar.visible" = true;
      "workbench.colorTheme" = "Tangram";
      "workbench.editor.enablePreview" = false;
      "workbench.editor.enablePreviewFromQuickOpen" = false;
      "workbench.startupEditor" = "none";
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[json]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[jsonc]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "vim.normalModeKeyBindings" = [
        {
          "after" = ["}"];
          "before" = ["J"];
        }
        {
          "after" = ["{"];
          "before" = ["K"];
        }
        {
          "after" = ["_"];
          "before" = ["H"];
        }
        {
          "after" = ["$"];
          "before" = ["L"];
        }
        {
          "before" = ["u"];
          "commands" = ["undo"];
        }
        {
          "before" = ["U"];
          "commands" = ["redo"];
        }
      ];
      "vim.visualModeKeyBindings" = [
        {
          "after" = ["}"];
          "before" = ["J"];
        }
        {
          "after" = ["{"];
          "before" = ["K"];
        }
        {
          "after" = ["_"];
          "before" = ["H"];
        }
        {
          "after" = ["$"];
          "before" = ["L"];
        }
      ];
      "vim.visualModeKeyBindingsNonRecursive" = [
        {
          "after" = ["p" "g" "v" "y"];
          "before" = ["p"];
        }
      ];
    };
  };
}
