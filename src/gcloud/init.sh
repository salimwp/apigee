# Step 1: Setup up env vars

AUTH="Authorization: Bearer $(gcloud auth print-access-token)"
PROJECT_ID="kinetic-pilot-360310"
RUNTIME_LOCATION="us-west1"
ANALYTICS_REGION="us-west1"
NETWORK_NAME="default"
RANGE_NAME=apigee-range

# Step 2: Enable APIs
gcloud services enable apigee.googleapis.com \
  servicenetworking.googleapis.com compute.googleapis.com \
  cloudkms.googleapis.com --project=$PROJECT_ID

# Step 3: Configure networking
gcloud compute addresses create $RANGE_NAME \
  --global \
  --prefix-length=22 \
  --description="Peering range for Apigee services" \
  --network=$NETWORK_NAME \
  --purpose=VPC_PEERING \
  --project=$PROJECT_ID

gcloud compute addresses create google-managed-services-default \
  --global \
  --prefix-length=28 \
  --description="Peering range for supporting Apigee services" \
  --network=$NETWORK_NAME \
  --purpose=VPC_PEERING \
  --project=$PROJECT_ID

gcloud services vpc-peerings connect \
  --service=servicenetworking.googleapis.com \
  --network=$NETWORK_NAME \
  --ranges=$RANGE_NAME,google-managed-services-support-default \
  --project=$PROJECT_ID

# Step 4: Create org
gcloud alpha apigee organizations provision \
  --runtime-location=$RUNTIME_LOCATION \
  --analytics-region=$ANALYTICS_REGION \
  --authorized-network=default \
  --project=$PROJECT_ID

# Step 5: Create internal machine
# export AUTH="Authorization: Bearer $(gcloud auth print-access-token)"
# export SUBNET=default
# export INSTANCE_NAME=k3s-vm
# export PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format="value(projectNumber)")
export VM_ZONE="us-west1-b"

# gcloud beta compute --project=$PROJECT_ID \
#  instances create $INSTANCE_NAME \
#  --zone=$VM_ZONE \
#  --machine-type=e2-standard-2 \
#  --subnet=$SUBNET \
#  --network-tier=PREMIUM \
#  --no-restart-on-failure \
#  --maintenance-policy=TERMINATE \
#  --preemptible \
#  --service-account=$PROJECT_NUMBER-compute@developer.gserviceaccount.com \
#  --scopes=https://www.googleapis.com/auth/cloud-platform \
#  --tags=http-server,https-server \
#  --image=debian-10-buster-v20210217 \
#  --image-project=debian-cloud \
#  --boot-disk-size=10GB \
#  --boot-disk-type=pd-standard \
#  --boot-disk-device-name=$INSTANCE_NAME \
#  --no-shielded-secure-boot \
#  --shielded-vtpm \
#  --shielded-integrity-monitoring \
#  --reservation-affinity=any

echo "Log into VM"
echo "gcloud compute ssh $INSTANCE_NAME --zone=$VM_ZONE --project=$PROJECT_ID"