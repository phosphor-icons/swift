//
//  Icons.swift
//  Phosphor Icons
//
//  Created by Tobias Fried on 1/22/23.
//  GENERATED FILE
//

import SwiftUI

public enum Ph: String, CaseIterable, Identifiable {
    public var id: Self { self }
    
    public enum IconWeight: String, CaseIterable, Identifiable {
        public var id: Self { self }
        
        case regular
        case thin
        case light
        case bold
        case fill
        case duotone
    }

    case addressBook = "address-book"
    case airTrafficControl = "air-traffic-control"
    case airplane
    case airplaneInFlight = "airplane-in-flight"
    case airplaneLanding = "airplane-landing"
    case airplaneTakeoff = "airplane-takeoff"
    case airplaneTilt = "airplane-tilt"
    case airplay
    case alarm
    case alien
    case alignBottom = "align-bottom"
    case alignBottomSimple = "align-bottom-simple"
    case alignCenterHorizontal = "align-center-horizontal"
    case alignCenterHorizontalSimple = "align-center-horizontal-simple"
    case alignCenterVertical = "align-center-vertical"
    case alignCenterVerticalSimple = "align-center-vertical-simple"
    case alignLeft = "align-left"
    case alignLeftSimple = "align-left-simple"
    case alignRight = "align-right"
    case alignRightSimple = "align-right-simple"
    case alignTop = "align-top"
    case alignTopSimple = "align-top-simple"
    case amazonLogo = "amazon-logo"
    case anchor
    case anchorSimple = "anchor-simple"
    case androidLogo = "android-logo"
    case angularLogo = "angular-logo"
    case aperture
    case appStoreLogo = "app-store-logo"
    case appWindow = "app-window"
    case appleLogo = "apple-logo"
    case applePodcastsLogo = "apple-podcasts-logo"
    case archive
    case archiveBox = "archive-box"
    case archiveTray = "archive-tray"
    case armchair
    case arrowArcLeft = "arrow-arc-left"
    case arrowArcRight = "arrow-arc-right"
    case arrowBendDoubleUpLeft = "arrow-bend-double-up-left"
    case arrowBendDoubleUpRight = "arrow-bend-double-up-right"
    case arrowBendDownLeft = "arrow-bend-down-left"
    case arrowBendDownRight = "arrow-bend-down-right"
    case arrowBendLeftDown = "arrow-bend-left-down"
    case arrowBendLeftUp = "arrow-bend-left-up"
    case arrowBendRightDown = "arrow-bend-right-down"
    case arrowBendRightUp = "arrow-bend-right-up"
    case arrowBendUpLeft = "arrow-bend-up-left"
    case arrowBendUpRight = "arrow-bend-up-right"
    case arrowCircleDown = "arrow-circle-down"
    case arrowCircleDownLeft = "arrow-circle-down-left"
    case arrowCircleDownRight = "arrow-circle-down-right"
    case arrowCircleLeft = "arrow-circle-left"
    case arrowCircleRight = "arrow-circle-right"
    case arrowCircleUp = "arrow-circle-up"
    case arrowCircleUpLeft = "arrow-circle-up-left"
    case arrowCircleUpRight = "arrow-circle-up-right"
    case arrowClockwise = "arrow-clockwise"
    case arrowCounterClockwise = "arrow-counter-clockwise"
    case arrowDown = "arrow-down"
    case arrowDownLeft = "arrow-down-left"
    case arrowDownRight = "arrow-down-right"
    case arrowElbowDownLeft = "arrow-elbow-down-left"
    case arrowElbowDownRight = "arrow-elbow-down-right"
    case arrowElbowLeft = "arrow-elbow-left"
    case arrowElbowLeftDown = "arrow-elbow-left-down"
    case arrowElbowLeftUp = "arrow-elbow-left-up"
    case arrowElbowRight = "arrow-elbow-right"
    case arrowElbowRightDown = "arrow-elbow-right-down"
    case arrowElbowRightUp = "arrow-elbow-right-up"
    case arrowElbowUpLeft = "arrow-elbow-up-left"
    case arrowElbowUpRight = "arrow-elbow-up-right"
    case arrowFatDown = "arrow-fat-down"
    case arrowFatLeft = "arrow-fat-left"
    case arrowFatLineDown = "arrow-fat-line-down"
    case arrowFatLineLeft = "arrow-fat-line-left"
    case arrowFatLineRight = "arrow-fat-line-right"
    case arrowFatLineUp = "arrow-fat-line-up"
    case arrowFatLinesDown = "arrow-fat-lines-down"
    case arrowFatLinesLeft = "arrow-fat-lines-left"
    case arrowFatLinesRight = "arrow-fat-lines-right"
    case arrowFatLinesUp = "arrow-fat-lines-up"
    case arrowFatRight = "arrow-fat-right"
    case arrowFatUp = "arrow-fat-up"
    case arrowLeft = "arrow-left"
    case arrowLineDown = "arrow-line-down"
    case arrowLineDownLeft = "arrow-line-down-left"
    case arrowLineDownRight = "arrow-line-down-right"
    case arrowLineLeft = "arrow-line-left"
    case arrowLineRight = "arrow-line-right"
    case arrowLineUp = "arrow-line-up"
    case arrowLineUpLeft = "arrow-line-up-left"
    case arrowLineUpRight = "arrow-line-up-right"
    case arrowRight = "arrow-right"
    case arrowSquareDown = "arrow-square-down"
    case arrowSquareDownLeft = "arrow-square-down-left"
    case arrowSquareDownRight = "arrow-square-down-right"
    case arrowSquareIn = "arrow-square-in"
    case arrowSquareLeft = "arrow-square-left"
    case arrowSquareOut = "arrow-square-out"
    case arrowSquareRight = "arrow-square-right"
    case arrowSquareUp = "arrow-square-up"
    case arrowSquareUpLeft = "arrow-square-up-left"
    case arrowSquareUpRight = "arrow-square-up-right"
    case arrowUDownLeft = "arrow-u-down-left"
    case arrowUDownRight = "arrow-u-down-right"
    case arrowULeftDown = "arrow-u-left-down"
    case arrowULeftUp = "arrow-u-left-up"
    case arrowURightDown = "arrow-u-right-down"
    case arrowURightUp = "arrow-u-right-up"
    case arrowUUpLeft = "arrow-u-up-left"
    case arrowUUpRight = "arrow-u-up-right"
    case arrowUp = "arrow-up"
    case arrowUpLeft = "arrow-up-left"
    case arrowUpRight = "arrow-up-right"
    case arrowsClockwise = "arrows-clockwise"
    case arrowsCounterClockwise = "arrows-counter-clockwise"
    case arrowsDownUp = "arrows-down-up"
    case arrowsHorizontal = "arrows-horizontal"
    case arrowsIn = "arrows-in"
    case arrowsInCardinal = "arrows-in-cardinal"
    case arrowsInLineHorizontal = "arrows-in-line-horizontal"
    case arrowsInLineVertical = "arrows-in-line-vertical"
    case arrowsInSimple = "arrows-in-simple"
    case arrowsLeftRight = "arrows-left-right"
    case arrowsMerge = "arrows-merge"
    case arrowsOut = "arrows-out"
    case arrowsOutCardinal = "arrows-out-cardinal"
    case arrowsOutLineHorizontal = "arrows-out-line-horizontal"
    case arrowsOutLineVertical = "arrows-out-line-vertical"
    case arrowsOutSimple = "arrows-out-simple"
    case arrowsSplit = "arrows-split"
    case arrowsVertical = "arrows-vertical"
    case article
    case articleMedium = "article-medium"
    case articleNyTimes = "article-ny-times"
    case asterisk
    case asteriskSimple = "asterisk-simple"
    case at
    case atom
    case baby
    case backpack
    case backspace
    case bag
    case bagSimple = "bag-simple"
    case balloon
    case bandaids
    case bank
    case barbell
    case barcode
    case barricade
    case baseball
    case baseballCap = "baseball-cap"
    case basket
    case basketball
    case bathtub
    case batteryCharging = "battery-charging"
    case batteryChargingVertical = "battery-charging-vertical"
    case batteryEmpty = "battery-empty"
    case batteryFull = "battery-full"
    case batteryHigh = "battery-high"
    case batteryLow = "battery-low"
    case batteryMedium = "battery-medium"
    case batteryPlus = "battery-plus"
    case batteryPlusVertical = "battery-plus-vertical"
    case batteryVerticalEmpty = "battery-vertical-empty"
    case batteryVerticalFull = "battery-vertical-full"
    case batteryVerticalHigh = "battery-vertical-high"
    case batteryVerticalLow = "battery-vertical-low"
    case batteryVerticalMedium = "battery-vertical-medium"
    case batteryWarning = "battery-warning"
    case batteryWarningVertical = "battery-warning-vertical"
    case bed
    case beerBottle = "beer-bottle"
    case beerStein = "beer-stein"
    case behanceLogo = "behance-logo"
    case bell
    case bellRinging = "bell-ringing"
    case bellSimple = "bell-simple"
    case bellSimpleRinging = "bell-simple-ringing"
    case bellSimpleSlash = "bell-simple-slash"
    case bellSimpleZ = "bell-simple-z"
    case bellSlash = "bell-slash"
    case bellZ = "bell-z"
    case bezierCurve = "bezier-curve"
    case bicycle
    case binoculars
    case bird
    case bluetooth
    case bluetoothConnected = "bluetooth-connected"
    case bluetoothSlash = "bluetooth-slash"
    case bluetoothX = "bluetooth-x"
    case boat
    case bone
    case book
    case bookBookmark = "book-bookmark"
    case bookOpen = "book-open"
    case bookOpenText = "book-open-text"
    case bookmark
    case bookmarkSimple = "bookmark-simple"
    case bookmarks
    case bookmarksSimple = "bookmarks-simple"
    case books
    case boot
    case boundingBox = "bounding-box"
    case bowlFood = "bowl-food"
    case bracketsAngle = "brackets-angle"
    case bracketsCurly = "brackets-curly"
    case bracketsRound = "brackets-round"
    case bracketsSquare = "brackets-square"
    case brain
    case brandy
    case bridge
    case briefcase
    case briefcaseMetal = "briefcase-metal"
    case broadcast
    case broom
    case browser
    case browsers
    case bug
    case bugBeetle = "bug-beetle"
    case bugDroid = "bug-droid"
    case buildings
    case bus
    case butterfly
    case cactus
    case cake
    case calculator
    case calendar
    case calendarBlank = "calendar-blank"
    case calendarCheck = "calendar-check"
    case calendarPlus = "calendar-plus"
    case calendarX = "calendar-x"
    case callBell = "call-bell"
    case camera
    case cameraPlus = "camera-plus"
    case cameraRotate = "camera-rotate"
    case cameraSlash = "camera-slash"
    case campfire
    case car
    case carProfile = "car-profile"
    case carSimple = "car-simple"
    case cardholder
    case cards
    case caretCircleDoubleDown = "caret-circle-double-down"
    case caretCircleDoubleLeft = "caret-circle-double-left"
    case caretCircleDoubleRight = "caret-circle-double-right"
    case caretCircleDoubleUp = "caret-circle-double-up"
    case caretCircleDown = "caret-circle-down"
    case caretCircleLeft = "caret-circle-left"
    case caretCircleRight = "caret-circle-right"
    case caretCircleUp = "caret-circle-up"
    case caretCircleUpDown = "caret-circle-up-down"
    case caretDoubleDown = "caret-double-down"
    case caretDoubleLeft = "caret-double-left"
    case caretDoubleRight = "caret-double-right"
    case caretDoubleUp = "caret-double-up"
    case caretDown = "caret-down"
    case caretLeft = "caret-left"
    case caretRight = "caret-right"
    case caretUp = "caret-up"
    case caretUpDown = "caret-up-down"
    case carrot
    case cassetteTape = "cassette-tape"
    case castleTurret = "castle-turret"
    case cat
    case cellSignalFull = "cell-signal-full"
    case cellSignalHigh = "cell-signal-high"
    case cellSignalLow = "cell-signal-low"
    case cellSignalMedium = "cell-signal-medium"
    case cellSignalNone = "cell-signal-none"
    case cellSignalSlash = "cell-signal-slash"
    case cellSignalX = "cell-signal-x"
    case certificate
    case chair
    case chalkboard
    case chalkboardSimple = "chalkboard-simple"
    case chalkboardTeacher = "chalkboard-teacher"
    case champagne
    case chargingStation = "charging-station"
    case chartBar = "chart-bar"
    case chartBarHorizontal = "chart-bar-horizontal"
    case chartDonut = "chart-donut"
    case chartLine = "chart-line"
    case chartLineDown = "chart-line-down"
    case chartLineUp = "chart-line-up"
    case chartPie = "chart-pie"
    case chartPieSlice = "chart-pie-slice"
    case chartPolar = "chart-polar"
    case chartScatter = "chart-scatter"
    case chat
    case chatCentered = "chat-centered"
    case chatCenteredDots = "chat-centered-dots"
    case chatCenteredText = "chat-centered-text"
    case chatCircle = "chat-circle"
    case chatCircleDots = "chat-circle-dots"
    case chatCircleText = "chat-circle-text"
    case chatDots = "chat-dots"
    case chatTeardrop = "chat-teardrop"
    case chatTeardropDots = "chat-teardrop-dots"
    case chatTeardropText = "chat-teardrop-text"
    case chatText = "chat-text"
    case chats
    case chatsCircle = "chats-circle"
    case chatsTeardrop = "chats-teardrop"
    case check
    case checkCircle = "check-circle"
    case checkFat = "check-fat"
    case checkSquare = "check-square"
    case checkSquareOffset = "check-square-offset"
    case checks
    case church
    case circle
    case circleDashed = "circle-dashed"
    case circleHalf = "circle-half"
    case circleHalfTilt = "circle-half-tilt"
    case circleNotch = "circle-notch"
    case circlesFour = "circles-four"
    case circlesThree = "circles-three"
    case circlesThreePlus = "circles-three-plus"
    case circuitry
    case clipboard
    case clipboardText = "clipboard-text"
    case clock
    case clockAfternoon = "clock-afternoon"
    case clockClockwise = "clock-clockwise"
    case clockCountdown = "clock-countdown"
    case clockCounterClockwise = "clock-counter-clockwise"
    case closedCaptioning = "closed-captioning"
    case cloud
    case cloudArrowDown = "cloud-arrow-down"
    case cloudArrowUp = "cloud-arrow-up"
    case cloudCheck = "cloud-check"
    case cloudFog = "cloud-fog"
    case cloudLightning = "cloud-lightning"
    case cloudMoon = "cloud-moon"
    case cloudRain = "cloud-rain"
    case cloudSlash = "cloud-slash"
    case cloudSnow = "cloud-snow"
    case cloudSun = "cloud-sun"
    case cloudWarning = "cloud-warning"
    case cloudX = "cloud-x"
    case club
    case coatHanger = "coat-hanger"
    case codaLogo = "coda-logo"
    case code
    case codeBlock = "code-block"
    case codeSimple = "code-simple"
    case codepenLogo = "codepen-logo"
    case codesandboxLogo = "codesandbox-logo"
    case coffee
    case coin
    case coinVertical = "coin-vertical"
    case coins
    case columns
    case command
    case compass
    case compassTool = "compass-tool"
    case computerTower = "computer-tower"
    case confetti
    case contactlessPayment = "contactless-payment"
    case control
    case cookie
    case cookingPot = "cooking-pot"
    case copy
    case copySimple = "copy-simple"
    case copyleft
    case copyright
    case cornersIn = "corners-in"
    case cornersOut = "corners-out"
    case couch
    case cpu
    case creditCard = "credit-card"
    case crop
    case cross
    case crosshair
    case crosshairSimple = "crosshair-simple"
    case crown
    case crownSimple = "crown-simple"
    case cube
    case cubeFocus = "cube-focus"
    case cubeTransparent = "cube-transparent"
    case currencyBtc = "currency-btc"
    case currencyCircleDollar = "currency-circle-dollar"
    case currencyCny = "currency-cny"
    case currencyDollar = "currency-dollar"
    case currencyDollarSimple = "currency-dollar-simple"
    case currencyEth = "currency-eth"
    case currencyEur = "currency-eur"
    case currencyGbp = "currency-gbp"
    case currencyInr = "currency-inr"
    case currencyJpy = "currency-jpy"
    case currencyKrw = "currency-krw"
    case currencyKzt = "currency-kzt"
    case currencyNgn = "currency-ngn"
    case currencyRub = "currency-rub"
    case cursor
    case cursorClick = "cursor-click"
    case cursorText = "cursor-text"
    case cylinder
    case database
    case desktop
    case desktopTower = "desktop-tower"
    case detective
    case devToLogo = "dev-to-logo"
    case deviceMobile = "device-mobile"
    case deviceMobileCamera = "device-mobile-camera"
    case deviceMobileSpeaker = "device-mobile-speaker"
    case deviceTablet = "device-tablet"
    case deviceTabletCamera = "device-tablet-camera"
    case deviceTabletSpeaker = "device-tablet-speaker"
    case devices
    case diamond
    case diamondsFour = "diamonds-four"
    case diceFive = "dice-five"
    case diceFour = "dice-four"
    case diceOne = "dice-one"
    case diceSix = "dice-six"
    case diceThree = "dice-three"
    case diceTwo = "dice-two"
    case disc
    case discordLogo = "discord-logo"
    case divide
    case dna
    case dog
    case door
    case doorOpen = "door-open"
    case dot
    case dotOutline = "dot-outline"
    case dotsNine = "dots-nine"
    case dotsSix = "dots-six"
    case dotsSixVertical = "dots-six-vertical"
    case dotsThree = "dots-three"
    case dotsThreeCircle = "dots-three-circle"
    case dotsThreeCircleVertical = "dots-three-circle-vertical"
    case dotsThreeOutline = "dots-three-outline"
    case dotsThreeOutlineVertical = "dots-three-outline-vertical"
    case dotsThreeVertical = "dots-three-vertical"
    case download
    case downloadSimple = "download-simple"
    case dress
    case dribbbleLogo = "dribbble-logo"
    case drop
    case dropHalf = "drop-half"
    case dropHalfBottom = "drop-half-bottom"
    case dropboxLogo = "dropbox-logo"
    case ear
    case earSlash = "ear-slash"
    case egg
    case eggCrack = "egg-crack"
    case eject
    case ejectSimple = "eject-simple"
    case elevator
    case engine
    case envelope
    case envelopeOpen = "envelope-open"
    case envelopeSimple = "envelope-simple"
    case envelopeSimpleOpen = "envelope-simple-open"
    case equalizer
    case equals
    case eraser
    case escalatorDown = "escalator-down"
    case escalatorUp = "escalator-up"
    case exam
    case exclude
    case excludeSquare = "exclude-square"
    case export
    case eye
    case eyeClosed = "eye-closed"
    case eyeSlash = "eye-slash"
    case eyedropper
    case eyedropperSample = "eyedropper-sample"
    case eyeglasses
    case faceMask = "face-mask"
    case facebookLogo = "facebook-logo"
    case factory
    case faders
    case fadersHorizontal = "faders-horizontal"
    case fan
    case fastForward = "fast-forward"
    case fastForwardCircle = "fast-forward-circle"
    case feather
    case figmaLogo = "figma-logo"
    case file
    case fileArchive = "file-archive"
    case fileArrowDown = "file-arrow-down"
    case fileArrowUp = "file-arrow-up"
    case fileAudio = "file-audio"
    case fileCloud = "file-cloud"
    case fileCode = "file-code"
    case fileCss = "file-css"
    case fileCsv = "file-csv"
    case fileDashed = "file-dashed"
    case fileDoc = "file-doc"
    case fileHtml = "file-html"
    case fileImage = "file-image"
    case fileJpg = "file-jpg"
    case fileJs = "file-js"
    case fileJsx = "file-jsx"
    case fileLock = "file-lock"
    case fileMagnifyingGlass = "file-magnifying-glass"
    case fileMinus = "file-minus"
    case filePdf = "file-pdf"
    case filePlus = "file-plus"
    case filePng = "file-png"
    case filePpt = "file-ppt"
    case fileRs = "file-rs"
    case fileSql = "file-sql"
    case fileSvg = "file-svg"
    case fileText = "file-text"
    case fileTs = "file-ts"
    case fileTsx = "file-tsx"
    case fileVideo = "file-video"
    case fileVue = "file-vue"
    case fileX = "file-x"
    case fileXls = "file-xls"
    case fileZip = "file-zip"
    case files
    case filmReel = "film-reel"
    case filmScript = "film-script"
    case filmSlate = "film-slate"
    case filmStrip = "film-strip"
    case fingerprint
    case fingerprintSimple = "fingerprint-simple"
    case finnTheHuman = "finn-the-human"
    case fire
    case fireExtinguisher = "fire-extinguisher"
    case fireSimple = "fire-simple"
    case firstAid = "first-aid"
    case firstAidKit = "first-aid-kit"
    case fish
    case fishSimple = "fish-simple"
    case flag
    case flagBanner = "flag-banner"
    case flagCheckered = "flag-checkered"
    case flagPennant = "flag-pennant"
    case flame
    case flashlight
    case flask
    case floppyDisk = "floppy-disk"
    case floppyDiskBack = "floppy-disk-back"
    case flowArrow = "flow-arrow"
    case flower
    case flowerLotus = "flower-lotus"
    case flowerTulip = "flower-tulip"
    case flyingSaucer = "flying-saucer"
    case folder
    case folderDashed = "folder-dashed"
    case folderLock = "folder-lock"
    case folderMinus = "folder-minus"
    case folderNotch = "folder-notch"
    case folderNotchMinus = "folder-notch-minus"
    case folderNotchOpen = "folder-notch-open"
    case folderNotchPlus = "folder-notch-plus"
    case folderOpen = "folder-open"
    case folderPlus = "folder-plus"
    case folderSimple = "folder-simple"
    case folderSimpleDashed = "folder-simple-dashed"
    case folderSimpleLock = "folder-simple-lock"
    case folderSimpleMinus = "folder-simple-minus"
    case folderSimplePlus = "folder-simple-plus"
    case folderSimpleStar = "folder-simple-star"
    case folderSimpleUser = "folder-simple-user"
    case folderStar = "folder-star"
    case folderUser = "folder-user"
    case folders
    case football
    case footprints
    case forkKnife = "fork-knife"
    case frameCorners = "frame-corners"
    case framerLogo = "framer-logo"
    case function
    case funnel
    case funnelSimple = "funnel-simple"
    case gameController = "game-controller"
    case garage
    case gasCan = "gas-can"
    case gasPump = "gas-pump"
    case gauge
    case gavel
    case gear
    case gearFine = "gear-fine"
    case gearSix = "gear-six"
    case genderFemale = "gender-female"
    case genderIntersex = "gender-intersex"
    case genderMale = "gender-male"
    case genderNeuter = "gender-neuter"
    case genderNonbinary = "gender-nonbinary"
    case genderTransgender = "gender-transgender"
    case ghost
    case gif
    case gift
    case gitBranch = "git-branch"
    case gitCommit = "git-commit"
    case gitDiff = "git-diff"
    case gitFork = "git-fork"
    case gitMerge = "git-merge"
    case gitPullRequest = "git-pull-request"
    case githubLogo = "github-logo"
    case gitlabLogo = "gitlab-logo"
    case gitlabLogoSimple = "gitlab-logo-simple"
    case globe
    case globeHemisphereEast = "globe-hemisphere-east"
    case globeHemisphereWest = "globe-hemisphere-west"
    case globeSimple = "globe-simple"
    case globeStand = "globe-stand"
    case goggles
    case goodreadsLogo = "goodreads-logo"
    case googleCardboardLogo = "google-cardboard-logo"
    case googleChromeLogo = "google-chrome-logo"
    case googleDriveLogo = "google-drive-logo"
    case googleLogo = "google-logo"
    case googlePhotosLogo = "google-photos-logo"
    case googlePlayLogo = "google-play-logo"
    case googlePodcastsLogo = "google-podcasts-logo"
    case gradient
    case graduationCap = "graduation-cap"
    case grains
    case grainsSlash = "grains-slash"
    case graph
    case gridFour = "grid-four"
    case gridNine = "grid-nine"
    case guitar
    case hamburger
    case hammer
    case hand
    case handCoins = "hand-coins"
    case handEye = "hand-eye"
    case handFist = "hand-fist"
    case handGrabbing = "hand-grabbing"
    case handHeart = "hand-heart"
    case handPalm = "hand-palm"
    case handPointing = "hand-pointing"
    case handSoap = "hand-soap"
    case handSwipeLeft = "hand-swipe-left"
    case handSwipeRight = "hand-swipe-right"
    case handTap = "hand-tap"
    case handWaving = "hand-waving"
    case handbag
    case handbagSimple = "handbag-simple"
    case handsClapping = "hands-clapping"
    case handsPraying = "hands-praying"
    case handshake
    case hardDrive = "hard-drive"
    case hardDrives = "hard-drives"
    case hash
    case hashStraight = "hash-straight"
    case headlights
    case headphones
    case headset
    case heart
    case heartBreak = "heart-break"
    case heartHalf = "heart-half"
    case heartStraight = "heart-straight"
    case heartStraightBreak = "heart-straight-break"
    case heartbeat
    case hexagon
    case highHeel = "high-heel"
    case highlighterCircle = "highlighter-circle"
    case hoodie
    case horse
    case hourglass
    case hourglassHigh = "hourglass-high"
    case hourglassLow = "hourglass-low"
    case hourglassMedium = "hourglass-medium"
    case hourglassSimple = "hourglass-simple"
    case hourglassSimpleHigh = "hourglass-simple-high"
    case hourglassSimpleLow = "hourglass-simple-low"
    case hourglassSimpleMedium = "hourglass-simple-medium"
    case house
    case houseLine = "house-line"
    case houseSimple = "house-simple"
    case iceCream = "ice-cream"
    case identificationBadge = "identification-badge"
    case identificationCard = "identification-card"
    case image
    case imageSquare = "image-square"
    case images
    case imagesSquare = "images-square"
    case infinity
    case info
    case instagramLogo = "instagram-logo"
    case intersect
    case intersectSquare = "intersect-square"
    case intersectThree = "intersect-three"
    case jeep
    case kanban
    case key
    case keyReturn = "key-return"
    case keyboard
    case keyhole
    case knife
    case ladder
    case ladderSimple = "ladder-simple"
    case lamp
    case laptop
    case layout
    case leaf
    case lifebuoy
    case lightbulb
    case lightbulbFilament = "lightbulb-filament"
    case lighthouse
    case lightning
    case lightningA = "lightning-a"
    case lightningSlash = "lightning-slash"
    case lineSegment = "line-segment"
    case lineSegments = "line-segments"
    case link
    case linkBreak = "link-break"
    case linkSimple = "link-simple"
    case linkSimpleBreak = "link-simple-break"
    case linkSimpleHorizontal = "link-simple-horizontal"
    case linkSimpleHorizontalBreak = "link-simple-horizontal-break"
    case linkedinLogo = "linkedin-logo"
    case linuxLogo = "linux-logo"
    case list
    case listBullets = "list-bullets"
    case listChecks = "list-checks"
    case listDashes = "list-dashes"
    case listMagnifyingGlass = "list-magnifying-glass"
    case listNumbers = "list-numbers"
    case listPlus = "list-plus"
    case lock
    case lockKey = "lock-key"
    case lockKeyOpen = "lock-key-open"
    case lockLaminated = "lock-laminated"
    case lockLaminatedOpen = "lock-laminated-open"
    case lockOpen = "lock-open"
    case lockSimple = "lock-simple"
    case lockSimpleOpen = "lock-simple-open"
    case lockers
    case magicWand = "magic-wand"
    case magnet
    case magnetStraight = "magnet-straight"
    case magnifyingGlass = "magnifying-glass"
    case magnifyingGlassMinus = "magnifying-glass-minus"
    case magnifyingGlassPlus = "magnifying-glass-plus"
    case mapPin = "map-pin"
    case mapPinLine = "map-pin-line"
    case mapTrifold = "map-trifold"
    case markerCircle = "marker-circle"
    case martini
    case maskHappy = "mask-happy"
    case maskSad = "mask-sad"
    case mathOperations = "math-operations"
    case medal
    case medalMilitary = "medal-military"
    case mediumLogo = "medium-logo"
    case megaphone
    case megaphoneSimple = "megaphone-simple"
    case messengerLogo = "messenger-logo"
    case metaLogo = "meta-logo"
    case metronome
    case microphone
    case microphoneSlash = "microphone-slash"
    case microphoneStage = "microphone-stage"
    case microsoftExcelLogo = "microsoft-excel-logo"
    case microsoftOutlookLogo = "microsoft-outlook-logo"
    case microsoftPowerpointLogo = "microsoft-powerpoint-logo"
    case microsoftTeamsLogo = "microsoft-teams-logo"
    case microsoftWordLogo = "microsoft-word-logo"
    case minus
    case minusCircle = "minus-circle"
    case minusSquare = "minus-square"
    case money
    case monitor
    case monitorPlay = "monitor-play"
    case moon
    case moonStars = "moon-stars"
    case moped
    case mopedFront = "moped-front"
    case mosque
    case motorcycle
    case mountains
    case mouse
    case mouseSimple = "mouse-simple"
    case musicNote = "music-note"
    case musicNoteSimple = "music-note-simple"
    case musicNotes = "music-notes"
    case musicNotesPlus = "music-notes-plus"
    case musicNotesSimple = "music-notes-simple"
    case navigationArrow = "navigation-arrow"
    case needle
    case newspaper
    case newspaperClipping = "newspaper-clipping"
    case notches
    case note
    case noteBlank = "note-blank"
    case notePencil = "note-pencil"
    case notebook
    case notepad
    case notification
    case notionLogo = "notion-logo"
    case numberCircleEight = "number-circle-eight"
    case numberCircleFive = "number-circle-five"
    case numberCircleFour = "number-circle-four"
    case numberCircleNine = "number-circle-nine"
    case numberCircleOne = "number-circle-one"
    case numberCircleSeven = "number-circle-seven"
    case numberCircleSix = "number-circle-six"
    case numberCircleThree = "number-circle-three"
    case numberCircleTwo = "number-circle-two"
    case numberCircleZero = "number-circle-zero"
    case numberEight = "number-eight"
    case numberFive = "number-five"
    case numberFour = "number-four"
    case numberNine = "number-nine"
    case numberOne = "number-one"
    case numberSeven = "number-seven"
    case numberSix = "number-six"
    case numberSquareEight = "number-square-eight"
    case numberSquareFive = "number-square-five"
    case numberSquareFour = "number-square-four"
    case numberSquareNine = "number-square-nine"
    case numberSquareOne = "number-square-one"
    case numberSquareSeven = "number-square-seven"
    case numberSquareSix = "number-square-six"
    case numberSquareThree = "number-square-three"
    case numberSquareTwo = "number-square-two"
    case numberSquareZero = "number-square-zero"
    case numberThree = "number-three"
    case numberTwo = "number-two"
    case numberZero = "number-zero"
    case nut
    case nyTimesLogo = "ny-times-logo"
    case octagon
    case officeChair = "office-chair"
    case option
    case orangeSlice = "orange-slice"
    case package
    case paintBrush = "paint-brush"
    case paintBrushBroad = "paint-brush-broad"
    case paintBrushHousehold = "paint-brush-household"
    case paintBucket = "paint-bucket"
    case paintRoller = "paint-roller"
    case palette
    case pants
    case paperPlane = "paper-plane"
    case paperPlaneRight = "paper-plane-right"
    case paperPlaneTilt = "paper-plane-tilt"
    case paperclip
    case paperclipHorizontal = "paperclip-horizontal"
    case parachute
    case paragraph
    case parallelogram
    case park
    case password
    case path
    case patreonLogo = "patreon-logo"
    case pause
    case pauseCircle = "pause-circle"
    case pawPrint = "paw-print"
    case paypalLogo = "paypal-logo"
    case peace
    case pen
    case penNib = "pen-nib"
    case penNibStraight = "pen-nib-straight"
    case pencil
    case pencilCircle = "pencil-circle"
    case pencilLine = "pencil-line"
    case pencilSimple = "pencil-simple"
    case pencilSimpleLine = "pencil-simple-line"
    case pencilSimpleSlash = "pencil-simple-slash"
    case pencilSlash = "pencil-slash"
    case pentagram
    case pepper
    case percent
    case person
    case personArmsSpread = "person-arms-spread"
    case personSimple = "person-simple"
    case personSimpleBike = "person-simple-bike"
    case personSimpleRun = "person-simple-run"
    case personSimpleThrow = "person-simple-throw"
    case personSimpleWalk = "person-simple-walk"
    case perspective
    case phone
    case phoneCall = "phone-call"
    case phoneDisconnect = "phone-disconnect"
    case phoneIncoming = "phone-incoming"
    case phoneOutgoing = "phone-outgoing"
    case phonePlus = "phone-plus"
    case phoneSlash = "phone-slash"
    case phoneX = "phone-x"
    case phosphorLogo = "phosphor-logo"
    case pi
    case pianoKeys = "piano-keys"
    case pictureInPicture = "picture-in-picture"
    case piggyBank = "piggy-bank"
    case pill
    case pinterestLogo = "pinterest-logo"
    case pinwheel
    case pizza
    case placeholder
    case planet
    case plant
    case play
    case playCircle = "play-circle"
    case playPause = "play-pause"
    case playlist
    case plug
    case plugCharging = "plug-charging"
    case plugs
    case plugsConnected = "plugs-connected"
    case plus
    case plusCircle = "plus-circle"
    case plusMinus = "plus-minus"
    case plusSquare = "plus-square"
    case pokerChip = "poker-chip"
    case policeCar = "police-car"
    case polygon
    case popcorn
    case pottedPlant = "potted-plant"
    case power
    case prescription
    case presentation
    case presentationChart = "presentation-chart"
    case printer
    case prohibit
    case prohibitInset = "prohibit-inset"
    case projectorScreen = "projector-screen"
    case projectorScreenChart = "projector-screen-chart"
    case pulse
    case pushPin = "push-pin"
    case pushPinSimple = "push-pin-simple"
    case pushPinSimpleSlash = "push-pin-simple-slash"
    case pushPinSlash = "push-pin-slash"
    case puzzlePiece = "puzzle-piece"
    case qrCode = "qr-code"
    case question
    case queue
    case quotes
    case radical
    case radio
    case radioButton = "radio-button"
    case radioactive
    case rainbow
    case rainbowCloud = "rainbow-cloud"
    case readCvLogo = "read-cv-logo"
    case receipt
    case receiptX = "receipt-x"
    case record
    case rectangle
    case recycle
    case redditLogo = "reddit-logo"
    case `repeat`
    case repeatOnce = "repeat-once"
    case rewind
    case rewindCircle = "rewind-circle"
    case roadHorizon = "road-horizon"
    case robot
    case rocket
    case rocketLaunch = "rocket-launch"
    case rows
    case rss
    case rssSimple = "rss-simple"
    case rug
    case ruler
    case scales
    case scan
    case scissors
    case scooter
    case screencast
    case scribbleLoop = "scribble-loop"
    case scroll
    case seal
    case sealCheck = "seal-check"
    case sealQuestion = "seal-question"
    case sealWarning = "seal-warning"
    case selection
    case selectionAll = "selection-all"
    case selectionBackground = "selection-background"
    case selectionForeground = "selection-foreground"
    case selectionInverse = "selection-inverse"
    case selectionPlus = "selection-plus"
    case selectionSlash = "selection-slash"
    case shapes
    case share
    case shareFat = "share-fat"
    case shareNetwork = "share-network"
    case shield
    case shieldCheck = "shield-check"
    case shieldCheckered = "shield-checkered"
    case shieldChevron = "shield-chevron"
    case shieldPlus = "shield-plus"
    case shieldSlash = "shield-slash"
    case shieldStar = "shield-star"
    case shieldWarning = "shield-warning"
    case shirtFolded = "shirt-folded"
    case shootingStar = "shooting-star"
    case shoppingBag = "shopping-bag"
    case shoppingBagOpen = "shopping-bag-open"
    case shoppingCart = "shopping-cart"
    case shoppingCartSimple = "shopping-cart-simple"
    case shower
    case shrimp
    case shuffle
    case shuffleAngular = "shuffle-angular"
    case shuffleSimple = "shuffle-simple"
    case sidebar
    case sidebarSimple = "sidebar-simple"
    case sigma
    case signIn = "sign-in"
    case signOut = "sign-out"
    case signature
    case signpost
    case simCard = "sim-card"
    case siren
    case sketchLogo = "sketch-logo"
    case skipBack = "skip-back"
    case skipBackCircle = "skip-back-circle"
    case skipForward = "skip-forward"
    case skipForwardCircle = "skip-forward-circle"
    case skull
    case slackLogo = "slack-logo"
    case sliders
    case slidersHorizontal = "sliders-horizontal"
    case slideshow
    case smiley
    case smileyAngry = "smiley-angry"
    case smileyBlank = "smiley-blank"
    case smileyMeh = "smiley-meh"
    case smileyNervous = "smiley-nervous"
    case smileySad = "smiley-sad"
    case smileySticker = "smiley-sticker"
    case smileyWink = "smiley-wink"
    case smileyXEyes = "smiley-x-eyes"
    case snapchatLogo = "snapchat-logo"
    case sneaker
    case sneakerMove = "sneaker-move"
    case snowflake
    case soccerBall = "soccer-ball"
    case sortAscending = "sort-ascending"
    case sortDescending = "sort-descending"
    case soundcloudLogo = "soundcloud-logo"
    case spade
    case sparkle
    case speakerHifi = "speaker-hifi"
    case speakerHigh = "speaker-high"
    case speakerLow = "speaker-low"
    case speakerNone = "speaker-none"
    case speakerSimpleHigh = "speaker-simple-high"
    case speakerSimpleLow = "speaker-simple-low"
    case speakerSimpleNone = "speaker-simple-none"
    case speakerSimpleSlash = "speaker-simple-slash"
    case speakerSimpleX = "speaker-simple-x"
    case speakerSlash = "speaker-slash"
    case speakerX = "speaker-x"
    case spinner
    case spinnerGap = "spinner-gap"
    case spiral
    case splitHorizontal = "split-horizontal"
    case splitVertical = "split-vertical"
    case spotifyLogo = "spotify-logo"
    case square
    case squareHalf = "square-half"
    case squareHalfBottom = "square-half-bottom"
    case squareLogo = "square-logo"
    case squareSplitHorizontal = "square-split-horizontal"
    case squareSplitVertical = "square-split-vertical"
    case squaresFour = "squares-four"
    case stack
    case stackOverflowLogo = "stack-overflow-logo"
    case stackSimple = "stack-simple"
    case stairs
    case stamp
    case star
    case starAndCrescent = "star-and-crescent"
    case starFour = "star-four"
    case starHalf = "star-half"
    case starOfDavid = "star-of-david"
    case steeringWheel = "steering-wheel"
    case steps
    case stethoscope
    case sticker
    case stool
    case stop
    case stopCircle = "stop-circle"
    case storefront
    case strategy
    case stripeLogo = "stripe-logo"
    case student
    case subtitles
    case subtract
    case subtractSquare = "subtract-square"
    case suitcase
    case suitcaseRolling = "suitcase-rolling"
    case suitcaseSimple = "suitcase-simple"
    case sun
    case sunDim = "sun-dim"
    case sunHorizon = "sun-horizon"
    case sunglasses
    case swap
    case swatches
    case swimmingPool = "swimming-pool"
    case sword
    case synagogue
    case syringe
    case tShirt = "t-shirt"
    case table
    case tabs
    case tag
    case tagChevron = "tag-chevron"
    case tagSimple = "tag-simple"
    case target
    case taxi
    case telegramLogo = "telegram-logo"
    case television
    case televisionSimple = "television-simple"
    case tennisBall = "tennis-ball"
    case tent
    case terminal
    case terminalWindow = "terminal-window"
    case testTube = "test-tube"
    case textAUnderline = "text-a-underline"
    case textAa = "text-aa"
    case textAlignCenter = "text-align-center"
    case textAlignJustify = "text-align-justify"
    case textAlignLeft = "text-align-left"
    case textAlignRight = "text-align-right"
    case textB = "text-b"
    case textColumns = "text-columns"
    case textH = "text-h"
    case textHFive = "text-h-five"
    case textHFour = "text-h-four"
    case textHOne = "text-h-one"
    case textHSix = "text-h-six"
    case textHThree = "text-h-three"
    case textHTwo = "text-h-two"
    case textIndent = "text-indent"
    case textItalic = "text-italic"
    case textOutdent = "text-outdent"
    case textStrikethrough = "text-strikethrough"
    case textT = "text-t"
    case textUnderline = "text-underline"
    case textbox
    case thermometer
    case thermometerCold = "thermometer-cold"
    case thermometerHot = "thermometer-hot"
    case thermometerSimple = "thermometer-simple"
    case thumbsDown = "thumbs-down"
    case thumbsUp = "thumbs-up"
    case ticket
    case tidalLogo = "tidal-logo"
    case tiktokLogo = "tiktok-logo"
    case timer
    case tipi
    case toggleLeft = "toggle-left"
    case toggleRight = "toggle-right"
    case toilet
    case toiletPaper = "toilet-paper"
    case toolbox
    case tooth
    case tote
    case toteSimple = "tote-simple"
    case trademark
    case trademarkRegistered = "trademark-registered"
    case trafficCone = "traffic-cone"
    case trafficSign = "traffic-sign"
    case trafficSignal = "traffic-signal"
    case train
    case trainRegional = "train-regional"
    case trainSimple = "train-simple"
    case tram
    case translate
    case trash
    case trashSimple = "trash-simple"
    case tray
    case tree
    case treeEvergreen = "tree-evergreen"
    case treePalm = "tree-palm"
    case treeStructure = "tree-structure"
    case trendDown = "trend-down"
    case trendUp = "trend-up"
    case triangle
    case trophy
    case truck
    case twitchLogo = "twitch-logo"
    case twitterLogo = "twitter-logo"
    case umbrella
    case umbrellaSimple = "umbrella-simple"
    case unite
    case uniteSquare = "unite-square"
    case upload
    case uploadSimple = "upload-simple"
    case usb
    case user
    case userCircle = "user-circle"
    case userCircleGear = "user-circle-gear"
    case userCircleMinus = "user-circle-minus"
    case userCirclePlus = "user-circle-plus"
    case userFocus = "user-focus"
    case userGear = "user-gear"
    case userList = "user-list"
    case userMinus = "user-minus"
    case userPlus = "user-plus"
    case userRectangle = "user-rectangle"
    case userSquare = "user-square"
    case userSwitch = "user-switch"
    case users
    case usersFour = "users-four"
    case usersThree = "users-three"
    case van
    case vault
    case vibrate
    case video
    case videoCamera = "video-camera"
    case videoCameraSlash = "video-camera-slash"
    case vignette
    case vinylRecord = "vinyl-record"
    case virtualReality = "virtual-reality"
    case virus
    case voicemail
    case volleyball
    case wall
    case wallet
    case warehouse
    case warning
    case warningCircle = "warning-circle"
    case warningDiamond = "warning-diamond"
    case warningOctagon = "warning-octagon"
    case watch
    case waveSawtooth = "wave-sawtooth"
    case waveSine = "wave-sine"
    case waveSquare = "wave-square"
    case waveTriangle = "wave-triangle"
    case waveform
    case waves
    case webcam
    case webcamSlash = "webcam-slash"
    case webhooksLogo = "webhooks-logo"
    case wechatLogo = "wechat-logo"
    case whatsappLogo = "whatsapp-logo"
    case wheelchair
    case wheelchairMotion = "wheelchair-motion"
    case wifiHigh = "wifi-high"
    case wifiLow = "wifi-low"
    case wifiMedium = "wifi-medium"
    case wifiNone = "wifi-none"
    case wifiSlash = "wifi-slash"
    case wifiX = "wifi-x"
    case wind
    case windowsLogo = "windows-logo"
    case wine
    case wrench
    case x
    case xCircle = "x-circle"
    case xSquare = "x-square"
    case yinYang = "yin-yang"
    case youtubeLogo = "youtube-logo"

    public var regular: Image { return Image(self.rawValue, bundle: .module) }

    public var thin: Image { return Image("\(self.rawValue)-thin", bundle: .module) }

    public var light: Image { return Image("\(self.rawValue)-light", bundle: .module) }

    public var bold: Image { return Image("\(self.rawValue)-bold", bundle: .module) }

    public var fill: Image { return Image("\(self.rawValue)-fill", bundle: .module) }

    public var duotone: Image { return Image("\(self.rawValue)-duotone", bundle: .module) }
    
    public func weight(_ weight: IconWeight) -> Image {
        switch weight {
        case .regular: return self.regular
        case .thin: return self.thin
        case .light: return self.light
        case .bold: return self.bold
        case .fill: return self.fill
        case .duotone: return self.duotone
        }
    }
}
