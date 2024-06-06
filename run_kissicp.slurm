#!/bin/bash
# Created by the University of Melbourne job script generator for SLURM
# Thu Jun 06 2024 11:25:23 GMT+1000 (Australian Eastern Standard Time)

# Partition for the job:
#SBATCH --partition=cascade

# Multithreaded (SMP) job: must run on one node 
#SBATCH --nodes=1

# The name of the job:
#SBATCH --job-name="kissicp"

# The project ID which this job should run under:
#SBATCH --account="punim2290"

# Maximum number of tasks/CPU cores used by the job:
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

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
#SBATCH --time=1-0:0:00

# check that the script is launched with sbatch
if [ "x$SLURM_JOB_ID" == "x" ]; then
   echo "You need to submit your job to the queuing system with sbatch"
   exit 1
fi

# Run the job from the directory where it was launched (default)

module load unimelb-mf-clients
module load GCCcore/11.3.0
module load Python/3.10.4

source ~/virtualenv/pin-python3.10.4/bin/activate

kiss_icp_pipeline --dataloader ouster_pcd --deskew --config kissicp_config.yaml /data/gpfs/projects/punim2290/data/route_59_14032024 # 2>&1 | tee kissicp_log.txt

##DO NOT ADD/EDIT BEYOND THIS LINE##
##Job monitor command to list the resource usage
my-job-stats -a -n -s