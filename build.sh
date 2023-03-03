if [ -z "$1" ] || [ -z "$2"]
  then
    echo "No version or description argument!"
  else
    now=$(date)
    version=$1
    description=$2
    stamp="${now} \nbuild v${version}\ndescription ${description}\n---------------" 
    echo ${stamp} >> build.text | echo ${stamp}
    docker buildx build --platform linux/amd64 -t "cr-becon-service:${version}" . >> build.text
    # docker save -o ncl-service:${version}.tar ncl-service:${version}
fi
