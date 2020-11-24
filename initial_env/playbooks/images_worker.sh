images=(pwcdsdevops/kube-proxy:v1.19.3
        pwcdsdevops/pause:3.2
        pwcdsdevops/coredns:1.7.0)
for imageName in ${images[@]};do
    docker pull $imageName
done

images_calico=(calico/node:v3.16.5
        calico/pod2daemon-flexvol:v3.16.5
        calico/cni:v3.16.5)

for imageName in ${images_calico[@]};do
    docker pull $imageName
done

for imageName in ${images[@]};do
    image=$(echo ${imageName} | awk -F '/' '{print $2}')
    docker tag ${imageName} k8s.gcr.io/$image
done

