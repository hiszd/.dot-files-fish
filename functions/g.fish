function g --description 'Wrap common Git functions'
    switch $argv[1]
        case addup aup au
            git add -u
        case addall aall aa
            git add .
        case checkout ch cout
            git checkout $argv[2..]
        case clone c cl
            git clone $argv[2..]
        case commit cm
            git commit -m $argv[2..]
        case pull pul pl
            git pull $argv[2..]
        case push pus psh
            git push $argv[2..]
        case status stat s
            git status $argv[2..]
        case '*'
            git $argv[1..]
    end
end
