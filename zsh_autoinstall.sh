#!/bin/bash
# According to: https://medium.com/@shivam1/make-your-terminal-beautiful-and-fast-with-zsh-shell-and-powerlevel10k-6484461c6efb
# Very simple ZSH install w/ no error checking 
# Includes: 
# - nerd fonts
# - powerline10k theme
# - auto-suggestion/syntax highlighting plugins
# - etc
#
# Installing from command line:
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/StolenThunda/AutoZSH/master/zsh_autoinstall.sh)"
 
echo "Installing ZSH..."
apt install -y zsh &&
echo
echo
echo "Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &&
 
echo
echo
echo "Install PowerLevel10K theme..."
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k &&
 
echo
echo
echo "Installing Nerd Fonts..."
# git clone https://github.com/ryanoasis/nerd-fonts && ./nerd-fonts/install.sh  ## download all fonts
git clone https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraMono/Regular/complete && ./nerd-fonts/install.sh FiraMono &
 
echo
echo
echo "Download Plugins for autosuggestion and syntax highlighting..."
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions &&
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting &&
 
echo
echo
DEF_THEME=` grep ZSH_THEME -m1 ~/.zshrc`
NEW_THEME='ZSH_THEME="powerlevel10k/powerlevel10k"'
echo "Changing theme from default $DEF_THEME to PowerLine10k..."
sed -i "s|${DEF_THEME}|${NEW_THEME}|g" ~/.zshrc
 
echo
echo
echo "Enabling AutoCorrection..."
DEF_AC="# ENABLE_CORRECTION"
NEW_AC="ENABLE_CORRECTION"
sed -i "s|${DEF_AC}|${NEW_AC}|g" ~/.zshrc
 
echo
echo
echo "Enabling plugins..."
DEF_PLUGINS="plugins=(git)"
NEW_PLUGINS="plugins=(git zsh-autosuggestions zsh-syntax-highlighting)"
sed -i "s|${DEF_PLUGINS}|${NEW_PLUGINS}|g" ~/.zshrc
 
 
echo "Apply..."
source ~/.zshrc
echo
echo
echo "Configure your new shell..."
p10k configure
