import edu.stanford.nlp.tagger.maxent.MaxentTagger;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class Main {

    /**
     * Example in Java
     *
     * Probably need to use EnglishGrammaticalRelations: https://nlp.stanford.edu/nlp/javadoc/javanlp/edu/stanford/nlp/trees/EnglishGrammaticalRelations.html
     * Parts of speech codes: http://www.ling.upenn.edu/courses/Fall_2003/ling001/penn_treebank_pos.html
     * There's also cause, phrase, word levels: https://gist.github.com/nlothian/9240750
     */
    public static void main(String[] args) {

        Properties props = new Properties();
        try {
            props.load(new FileInputStream("lib/edu/stanford/nlp/models/pos-tagger/english-left3words/english-left3words-distsim.tagger.props"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        MaxentTagger tagger = new MaxentTagger(
            "lib/edu/stanford/nlp/models/pos-tagger/english-left3words/english-left3words-distsim.tagger",
            props
        );

        String sample = "This is a sample text";

        String tagged = tagger.tagString(sample);

        System.out.println(tagged);

//        StringReader sr = new StringReader("Who should I give it to?");
//        PTBTokenizer<Word> tokenizer = PTBTokenizer.newPTBTokenizer(sr);
//        List<Word> tokens = tokenizer.tokenize();
//        System.out.println("TOKENS: " + tokens);
//        //LexicalizedParser parser = LexicalizedParser.loadModel();
//        Options options = new Options(new EnglishTreebankParserParams());
//        options.setOptions("-retainTmpSubcategories");
//        //options.setOption(new String[] {"-splitTMP"}, 1);
//        //LexicalizedParser parser = LexicalizedParser.loadModel(options);
//
//        Tree tree = parser.apply(tokens);
//        System.out.println("TREE: " + tree);
//
//        //EnglishGrammaticalRelations.DIRECT_OBJECT
//        //System.out.println("RESULT: " + r);
    }
}
