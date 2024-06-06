#!/bin/bash
# Created by the University of Melbourne job script generator for SLURM
# Thu May 23 2024 16:41:21 GMT+1000 (Australian Eastern Standard Time)

# The name of the job:
#SBATCH --job-name="pin-slam"

# The project ID which this job should run under:
#SBATCH --account="punim2290"

# Partition for the job:
#SBATCH --partition=gpu-a100

# Multithreaded (SMP) job: must run on one node 
#SBATCH --nodes=1

# Maximum number of tasks/CPU cores used by the job:
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1

# The amount of memory in megabytes per node:
#SBATCH --mem=81920

# Number of GPUs requested per node:
#SBATCH --gres=gpu:1

# Use this email address:
#SBATCH --mail-user=junjzhang@unimelb.edu.au
# Send yourself an email when the job:
# aborts abnormally (fails)
#SBATCH --mail-type=FAIL
# begins
#SBATCH --mail-type=BEGIN
# ends successfully
#SBATCH --mail-type=END

# The maximum running time of the job in days-hours:mins:sec
#SBATCH --time=2-0:0:00

# check that the script is launched with sbatch
if [ "x$SLURM_JOB_ID" == "x" ]; then
   echo "You need to submit your job to the queuing system with sbatch"
   exit 1
fi

# Run the job from the directory where it was launched (default)

module load unimelb-mf-clients
module load GCCcore/11.3.0
module load Python/3.10.4

# virtualenv ~/virtualenv/pin-python3.10.4
source ~/virtualenv/pin-python3.10.4/bin/activate
# pip install torch torchvision torchaudio open3d scikit-image gtsam wandb tqdm rich roma natsort pyquaternion pypose evo

# mkdir /tmp/route_59_14032024_1
# unimelb-mf-download --nb-workers 4 --out /tmp/route_59_14032024_1 /projects/proj-4320_tram_digital_twin-1128.4.913/data/route_59_14032024/drive_1/pcd
# mkdir /tmp/route_59_14032024_2
# unimelb-mf-download --nb-workers 4 --out /tmp/route_59_14032024_2 /projects/proj-4320_tram_digital_twin-1128.4.913/data/route_59_14032024/drive_2/pcd
# mkdir /tmp/route_59_14032024
# mv /tmp/route_59_14032024_1/pcd/* /tmp/route_59_14032024/
# mv /tmp/route_59_14032024_2/pcd/* /tmp/route_59_14032024/
# rm -rf /tmp/route_59_14032024_1
# rm -rf /tmp/route_59_14032024_2

python pin_slam.py ./config/lidar_slam/run_ouster_128.yaml # 2>&1 | tee log.txt

##DO NOT ADD/EDIT BEYOND THIS LINE##
##Job monitor command to list the resource usage
my-job-stats -a -n -s