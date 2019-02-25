import glob
import os
for filepath in glob.iglob('faces/*.pgm'):
	if ("_2" in filepath) or ("_4" in filepath):
		os.remove(filepath)
