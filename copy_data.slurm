#!/bin/bash
# Created by the University of Melbourne job script generator for SLURM
# Thu May 23 2024 16:41:21 GMT+1000 (Australian Eastern Standard Time)

# The name of the job:
#SBATCH --job-name="copy-data"

# The project ID which this job should run under:
#SBATCH --account="punim2290"

# Partition for the job:
#SBATCH --partition=gpu-a100-short

# Multithreaded (SMP) job: must run on one node 
#SBATCH --nodes=1

# Maximum number of tasks/CPU cores used by the job:
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1

# The amount of memory in megabytes per node:
# #SBATCH --mem=8192

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
#SBATCH --time=0-4:0:00

# check that the script is launched with sbatch
if [ "x$SLURM_JOB_ID" == "x" ]; then
   echo "You need to submit your job to the queuing system with sbatch"
   exit 1
fi

# Run the job from the directory where it was launched (default)

module load unimelb-mf-clients

mkdir -p /data/gpfs/projects/punim2290/data/route_59_14032024_1
mkdir -p /data/gpfs/projects/punim2290/data/route_59_14032024_2
mkdir -p /data/gpfs/projects/punim2290/data/route_59_14032024

unimelb-mf-download --nb-workers 4 --out /data/gpfs/projects/punim2290/data/route_59_14032024_1 /projects/proj-4320_tram_digital_twin-1128.4.913/data/route_59_14032024/drive_1/pcd
mv /data/gpfs/projects/punim2290/data/route_59_14032024_1/pcd/* /data/gpfs/projects/punim2290/data/route_59_14032024/
rm -rf /data/gpfs/projects/punim2290/data/route_59_14032024_1

unimelb-mf-download --nb-workers 4 --out /data/gpfs/projects/punim2290/data/route_59_14032024_2 /projects/proj-4320_tram_digital_twin-1128.4.913/data/route_59_14032024/drive_2/pcd
mv /data/gpfs/projects/punim2290/data/route_59_14032024_2/pcd/* /data/gpfs/projects/punim2290/data/route_59_14032024/
rm -rf /data/gpfs/projects/punim2290/data/route_59_14032024_2