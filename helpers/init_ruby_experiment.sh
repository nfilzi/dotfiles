init_ruby_experiment() {
  while getopts ":n:" option; do
    case "${option}" in
      n)
        name=${OPTARG}
        ;;
    esac
  done

  if [[ ! ${name}  ]]; then
    echo "Defaulting to 'ruby_experiment' for your folder name"
    name="ruby_experiment"
  fi

  echo "Creating ${name} folder.."
  mkdir "${name}"

  cd "${name}"

  echo "Initiating bundler with useful gems.."
  echo "*************************************"
  bundle init
  bundle add "pry-byebug"
  echo "*************************************"

  echo "Adding basic setup in 'main.rb'.."
  touch "main.rb"
  echo "require 'bundler/setup'\nBundler.require(:default)\n\n# TODO: Do your magic 🧙‍♂️" > "main.rb"
  echo "Finished!"
  subl .
  subl -a "main.rb"
}
