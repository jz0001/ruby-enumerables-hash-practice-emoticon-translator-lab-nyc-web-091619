# require modules here
require "yaml"


def load_library(path)
  emoticons = YAML.load_file(path)
  
  new_hash = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }

  emoticons.each do |key,value|
    new_hash['get_emoticon'][value[0]] = emoticons[key][1]
    new_hash['get_meaning'][value[1]] = key
  end

  new_hash
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