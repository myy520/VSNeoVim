#!/usr/bin/bash
function usage() {
  echo "Usage: install.sh [<options>]"
  echo ""
  echo "Options:"
  echo "    -d, --dependencies                       dependencies"
  echo "    -i, --install                            installing all dependencies"
  echo "    -m, --miniinstall                        minimal installation dependencies"
}
function dependencies() {
  echo "Visual Studio NeoVim All dependencies."
  echo ""
  echo "  neovim      "
  echo "  lua         "
  echo "  luajit      "
  echo "  python      "
  echo "  npm         "
  echo "  node        "
  echo "  yarn        "
  echo "  python-pip  "
  echo "  lazygit     "
  echo "  tree-sitter "
  echo ""
}
function detect_platform() {
  OS="$(uname -s)"
  case "$OS" in
    Linux)
      if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
        RECOMMEND_INSTALL="sudo pacman -S"
      elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
        RECOMMEND_INSTALL="sudo dnf install -y"
      elif [ -f "/etc/gentoo-release" ]; then
        RECOMMEND_INSTALL="emerge install -y"
      else # assume debian based
        RECOMMEND_INSTALL="sudo apt install -y"
      fi
      ;;
    FreeBSD)
      RECOMMEND_INSTALL="sudo pkg install -y"
      ;;
    NetBSD)
      RECOMMEND_INSTALL="sudo pkgin install"
      ;;
    OpenBSD)
      RECOMMEND_INSTALL="doas pkg_add"
      ;;
    Darwin)
      RECOMMEND_INSTALL="brew install"
      ;;
    *)
      echo "OS $OS is not currently supported."
      exit 1
      ;;
  esac
}
function __installing_neovim() {
  echo "Would you like to install VSNeovim's neovim ?"
  read -p "[Y]es or [N]o : " answer
  if [[ "$answer" == "Y" || "$answer" == "y" ]]; then
    $RECOMMEND_INSTALL neovim
  fi
}
function __installing_lua() {
  echo "Would you like to install VSNeovim's lua and luajit ?"
  read -p "[Y]es or [N]o : " answer
  if [[ "$answer" == "Y" || "$answer" == "y" ]]; then
    $RECOMMEND_INSTALL lua luajit
  fi
}
function __installing_python() {
  echo "Would you like to install VSNeovim's python ?"
  read -p "[Y]es or [N]o : " answer
  if [[ "$answer" == "Y" || "$answer" == "y" ]]; then
    python3 -m pip install pynvim
  fi
}
function __installing_node() {
  echo "Would you like to install VSNeovim's node ?"
  read -p "[Y]es or [N]o : " answer
  if [[ "$answer" == "Y" || "$answer" == "y" ]]; then
    $RECOMMEND_INSTALL nodejs npm yarn
  fi
}
function __installing_utils() {
  echo "Would you like to install VSNeovim's utils (treesitter and lazygit) ?"
  read -p "[Y]es or [N]o : " answer
  if [[ "$answer" == "Y" || "$answer" == "y" ]]; then
    $RECOMMEND_INSTALL lazygit  tree-sitter
  fi
}
function installation() {
  detect_platform
  __installing_neovim
  __installing_lua
  __installing_python
  __installing_node
  __installing_utils
}
function miniinstallation() {
  detect_platform
  __installing_lua
  __installing_python
  __installing_node
}
function cloning_vsneovim() {
  echo "cloning VSNeoVim ..."
  mv $HOME/.config/nvim/ $HOME/.config/NVIM_OLD
  mv $HOME/.local/share/nvim/ $HOME/.local/share/NVIM_OLD
  git clone https://github.com/VSNeovim/VSNeovim ~/.config/nvim
}
function getting_started() {
  nvim +PackerSync
}
function parse_arguments() {
  while [ "$#" -gt 0 ]; do
    case "$1" in
      -d | --dependencies)
        dependencies   
        exit 0
        ;;
      -i | --install)
        installation
        cloning_vsneovim
        getting_started
        ;;
      -m | --miniinstall)
        miniinstallation
        cloning_vsneovim
        getting_started
        exit 0
        ;;
      -h | --help)
        usage
        exit 0
        ;;
    esac
    shift
  done
}
function done() {
  echo "Installing :"
  echo "  dependencies ( ./install.sh -d )"
  echo "Thank you for installing Visual Studio NeoVim :)"
}
function main() {
  parse_arguments "$@"
  usage
}
main "$@"
