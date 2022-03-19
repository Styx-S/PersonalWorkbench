package util

import (
	random "PW/foundation/util/random_utility"
	"strings"
)

const lowercaseAlphas = "abcdefghijklmnopqrstuvwxyz"
const uppercaseAlphas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
const digitSet = "0123456789"
const commonSymbol = "!@#$%_"
const allSymbol = "!@#$%_"

type CharType uint32
type GenMode uint32

const (
	CharType_LA CharType = 1 << 0 // 小写字符
	CharType_UA CharType = 1 << 1 // 大写字符
	CharType_DS CharType = 1 << 2 // 数字
	CharType_CS CharType = 1 << 3 // 常用符号
	CharType_AS CharType = 1 << 4 // 所有符号

	CharType_Alpha CharType = CharType_LA | CharType_UA                  // 字母
	CharType_Pass  CharType = CharType_Alpha | CharType_DS | CharType_CS // 密码（四种类型)
	CharType_All   CharType = CharType_Alpha | CharType_DS | CharType_AS // 所有
)

const (
	GenMode_Default GenMode = 0 // 全随机
	GenMode_Each    GenMode = 1 // 必须包含所有指定类型
)

type StrGenerator struct {
	CharType       CharType // 能够生成的字符类型
	GenMode        GenMode  // 生成模式
	defaultBuiders []rune   // 可用的全部字符（不分类型）
	allBuilders    [][]rune // 可用的全部字符（分类型）
	typeCount      int      // 类型数量

}

func (g *StrGenerator) Setup() {

	g.typeCount = 0
	for i := g.CharType; i != 0; i >>= 1 {
		g.typeCount++
	}

	if g.typeCount == 0 {
		panic("should have at least one type...")
	}

	switch g.GenMode {
	case GenMode_Default:
		g.defaultBuiders = make([]rune, 0)
		charTypeIterator(g.CharType, func(str string) {
			g.defaultBuiders = append(g.defaultBuiders, []rune(str)...)
		})

	case GenMode_Each:
		g.defaultBuiders = make([]rune, 0)
		g.allBuilders = make([][]rune, 0)
		charTypeIterator(g.CharType, func(str string) {
			g.allBuilders = append(g.allBuilders, []rune(str))
			g.defaultBuiders = append(g.defaultBuiders, []rune(str)...)
		})
		if g.typeCount != len(g.allBuilders) {
			panic("")
		}
	}

}

func (g *StrGenerator) GenStr(length int) string {
	strBuilder := strings.Builder{}
	defaultBuilderLen := len(g.defaultBuiders)

	switch g.GenMode {
	case GenMode_Default:
		// 直接随机拼接即可
		for i := 0; i < length; i++ {
			strBuilder.WriteRune(g.defaultBuiders[random.DefaultRand().Intn(defaultBuilderLen)])
		}
	case GenMode_Each:
		// 1.先给每种类型随机1个位置
		// 2.剩下的类型再全部随机
		if length < g.typeCount {
			panic("")
		}

		fixedLoc := random.DefaultRandomUtil().RandomNoRepeatedNumberInRange(g.typeCount, 0, length, true)
		pickBuilders := random.DefaultRandomUtil().RandomNoRepeatedNumberInRange(g.typeCount, 0, g.typeCount, false)
		cursor := 0
		for i := 0; i < length; i++ {
			if i == fixedLoc[cursor] {
				// 对应范围内随机
				builder := g.allBuilders[pickBuilders[cursor]]
				strBuilder.WriteRune(builder[random.DefaultRand().Intn(len(builder))])
			} else {
				// 直接随机
				strBuilder.WriteRune(g.defaultBuiders[random.DefaultRand().Intn(defaultBuilderLen)])
			}
		}
	}
	return strBuilder.String()
}

func DefaultRand() {
	panic("unimplemented")
}

func charTypeIterator(charType CharType, visitor func(string)) {
	if charType&CharType_LA == CharType_LA {
		visitor(lowercaseAlphas)
	}
	if charType&CharType_UA == CharType_UA {
		visitor(uppercaseAlphas)
	}
	if charType&CharType_DS == CharType_DS {
		visitor(digitSet)
	}
	if charType&CharType_CS == CharType_CS {
		visitor(commonSymbol)
	}
	if charType&CharType_AS == CharType_AS {
		visitor(allSymbol)
	}
}
