package engine.internal.save;

import engine.internal.save.raw.RawSave;

class SaveData extends RawSave{
	static final raw = RawSave;

	/**
	 * [Find Data]
	 * @param name Data Name 
	*/
	public static function get(name:String){
		//return raw.getData(name);
	}

	/**
	 * [Save Data]
	 * @param name Data Name
	 * @param value Data Value (Any)
	*/
	public static function save(name:String, id:Dynamic){
		//return raw.setData(name, id);
	}

	public static function file(load = false){
		if (load)
			return raw.loadData();

		return raw.saveData();
	}

    public static function init():Void{
		//file(true);

		//if (get('autoPause') == null)
			//save('autoPause', true);
		//save('autoPause', true);

		//file(true);
		//raw.getFilePath();
		file();

		file(true);
    }
}