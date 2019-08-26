# require modules here
require "yaml"


def load_library(path)
  emo = YAML.load_file(path)
  
  emo2 = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }

  emo.each do |key,value|
    emo2['get_emoticon'][value[0]] = emo[key][1]
    emo2['get_meaning'][value[1]] = key
  end

  emo2
end

def get_japanese_emoticon(path, w_emo)
  j_emo = load_library(path)['get_emoticon'][w_emo]
  if j_emo
    j_emo
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, j_emo)
  w_meaning=load_library(path)['get_meaning'][j_emo]
  if w_meaning
    w_meaning
  else
    return "Sorry, that emoticon was not found"
  end
end