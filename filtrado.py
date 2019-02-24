import glob
import os
for filepath in glob.iglob('faces/*.pgm'):
	if ("2" in filepath) or ("4" in filepath):
		os.remove(filepath)
