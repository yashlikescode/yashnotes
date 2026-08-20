### How to use requirements.txt
source venv/bin/activate
pip install fastapi uvicorn
pip freeze > requirements.txt   # update the file
git add requirements.txt
git commit -m "add fastapi and uvicorn"

### Starting the app development
1. Create the venv
python -m venv venv

2. Activate it
source venv/bin/activate      # macOS/Linux
venv\Scripts\activate         # Windows (cmd)
venv\Scripts\Activate.ps1     # Windows (PowerShell)

3. Now install — pick ONE option
pip install "fastapi[standard]"
fastapi dev main.py

OR

pip install fastapi uvicorn
uvicorn main:app --reload