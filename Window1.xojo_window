#tag DesktopWindow
Begin DesktopWindow Window1
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   0
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   HasTitleBar     =   True
   Height          =   700
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   1752682495
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "AWS_S3_Tests"
   Type            =   0
   Visible         =   True
   Width           =   1000
   Begin DesktopTextArea TextArea1
      AcceptTabs      =   "False"
      Alignment       =   "0"
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   True
      AllowStyledText =   True
      AllowTabs       =   False
      AutoDeactivate  =   "True"
      AutomaticallyCheckSpelling=   "True"
      BackColor       =   "&cFFFFFF00"
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Border          =   "True"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   447
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   496
      LimitText       =   "0"
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   "False"
      ScrollbarVertical=   "True"
      Styled          =   "True"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   "0.0"
      TextUnit        =   "0"
      Tooltip         =   ""
      Top             =   198
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   "True"
      ValidationMask  =   ""
      Visible         =   True
      Width           =   484
   End
   Begin DesktopListBox lb_objects
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      AutoDeactivate  =   "True"
      AutoHideScrollbars=   "True"
      Bold            =   False
      Border          =   "True"
      ColumnCount     =   1
      ColumnsResizable=   "False"
      ColumnWidths    =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   "False"
      EnableDragReorder=   "False"
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHeading      =   "False"
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   200
      HelpTag         =   ""
      Hierarchical    =   "False"
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      ScrollbarHorizontal=   "False"
      ScrollBarVertical=   "True"
      SelectionType   =   "0"
      ShowDropIndicator=   "False"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   "0.0"
      TextUnit        =   "0"
      Tooltip         =   ""
      Top             =   198
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   "True"
      Visible         =   True
      Width           =   455
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopButton pb_get_buckets
      AllowAutoDeactivate=   True
      AutoDeactivate  =   "True"
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Buckets"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   "0.0"
      TextUnit        =   "0"
      Tooltip         =   ""
      Top             =   29
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopButton pb_objects_in_bucket
      AllowAutoDeactivate=   True
      AutoDeactivate  =   "True"
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Objects in bucket"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   "0.0"
      TextUnit        =   "0"
      Tooltip         =   ""
      Top             =   166
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   133
   End
   Begin DesktopButton pb_get_content
      AllowAutoDeactivate=   True
      AutoDeactivate  =   "True"
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Get content"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   "0.0"
      TextUnit        =   "0"
      Tooltip         =   ""
      Top             =   410
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   143
   End
   Begin DesktopLabel Label1
      AllowAutoDeactivate=   True
      AutoDeactivate  =   "True"
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlign       =   "0"
      TextAlignment   =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   "0.0"
      TextUnit        =   "0"
      Tooltip         =   ""
      Top             =   657
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   244
   End
   Begin DesktopLabel Label2
      AllowAutoDeactivate=   True
      AutoDeactivate  =   "True"
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   496
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlign       =   "0"
      TextAlignment   =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   "0.0"
      TextUnit        =   "0"
      Tooltip         =   ""
      Top             =   657
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   352
   End
   Begin DesktopListBox lb_buckets
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      AutoDeactivate  =   "True"
      AutoHideScrollbars=   "True"
      Bold            =   False
      Border          =   "True"
      ColumnCount     =   1
      ColumnsResizable=   "False"
      ColumnWidths    =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   "False"
      EnableDragReorder=   "False"
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHeading      =   "False"
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   94
      HelpTag         =   ""
      Hierarchical    =   "False"
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      ScrollbarHorizontal=   "False"
      ScrollBarVertical=   "True"
      SelectionType   =   "0"
      ShowDropIndicator=   "False"
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   "0.0"
      TextUnit        =   "0"
      Tooltip         =   ""
      Top             =   61
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   "True"
      Visible         =   True
      Width           =   455
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopTextArea ta_file_content
      AcceptTabs      =   "False"
      Alignment       =   "0"
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   True
      AllowStyledText =   True
      AllowTabs       =   False
      AutoDeactivate  =   "True"
      AutomaticallyCheckSpelling=   "True"
      BackColor       =   "&cFFFFFF00"
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Border          =   "True"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   203
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   "0"
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   "False"
      ScrollbarVertical=   "True"
      Styled          =   "True"
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   "0.0"
      TextUnit        =   "0"
      Tooltip         =   ""
      Top             =   442
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   "True"
      ValidationMask  =   ""
      Visible         =   True
      Width           =   455
   End
   Begin DesktopLabel lbl_selectedBucket
      AllowAutoDeactivate=   True
      AutoDeactivate  =   "True"
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   175
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "-"
      TextAlign       =   "0"
      TextAlignment   =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   "0.0"
      TextUnit        =   "0"
      Tooltip         =   ""
      Top             =   166
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   300
   End
   Begin DesktopLabel lbl_selectedObject
      AllowAutoDeactivate=   True
      AutoDeactivate  =   "True"
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   175
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "-"
      TextAlign       =   "0"
      TextAlignment   =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   "0.0"
      TextUnit        =   "0"
      Tooltip         =   ""
      Top             =   410
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   300
   End
   Begin DesktopLabel Label5
      AllowAutoDeactivate=   True
      AutoDeactivate  =   "True"
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   141
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Navigation"
      TextAlign       =   "0"
      TextAlignment   =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   "0.0"
      TextUnit        =   "0"
      Tooltip         =   ""
      Top             =   29
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   334
   End
   Begin DesktopButton pb_save_object
      AllowAutoDeactivate=   True
      AutoDeactivate  =   "True"
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Save file"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   332
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   25
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   "0.0"
      TextUnit        =   "0"
      Tooltip         =   ""
      Top             =   657
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   143
   End
   Begin DesktopLabel Label7
      AllowAutoDeactivate=   True
      AutoDeactivate  =   "True"
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   505
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   33
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Query results"
      TextAlign       =   "0"
      TextAlignment   =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   "0.0"
      TextUnit        =   "0"
      Tooltip         =   ""
      Top             =   166
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   475
   End
   Begin DesktopGroupBox GroupBox1
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Tests"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   134
      Index           =   -2147483648
      Italic          =   False
      Left            =   496
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   34
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   484
      Begin DesktopLabel Label6
         AllowAutoDeactivate=   True
         AutoDeactivate  =   "True"
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   516
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Test Ok behaviour"
         TextAlign       =   "0"
         TextAlignment   =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   "0.0"
         TextUnit        =   "0"
         Tooltip         =   ""
         Top             =   88
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   156
      End
      Begin DesktopLabel Label4
         AllowAutoDeactivate=   True
         AutoDeactivate  =   "True"
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   516
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "(using fixed parameters)"
         TextAlign       =   "0"
         TextAlignment   =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   "0.0"
         TextUnit        =   "0"
         Tooltip         =   ""
         Top             =   116
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   164
      End
      Begin DesktopLabel Label3
         AllowAutoDeactivate=   True
         AutoDeactivate  =   "True"
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   516
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Test error behaviour"
         TextAlign       =   "0"
         TextAlignment   =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   "0.0"
         TextUnit        =   "0"
         Tooltip         =   ""
         Top             =   56
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   156
      End
      Begin DesktopButton pb_run_ok_test
         AllowAutoDeactivate=   True
         AutoDeactivate  =   "True"
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Run test"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   891
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   "0.0"
         TextUnit        =   "0"
         Tooltip         =   ""
         Top             =   88
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin DesktopButton pb_run_err_test
         AllowAutoDeactivate=   True
         AutoDeactivate  =   "True"
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Run test"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   891
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   "0.0"
         TextUnit        =   "0"
         Tooltip         =   ""
         Top             =   56
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin DesktopPopupMenu pm_ok_tests
         AllowAutoDeactivate=   True
         AutoDeactivate  =   "True"
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         InitialValue    =   ""
         Italic          =   False
         Left            =   684
         ListIndex       =   "-1"
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         SelectedRowIndex=   -1
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   "0.0"
         TextUnit        =   "0"
         Tooltip         =   ""
         Top             =   88
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   196
      End
      Begin DesktopPopupMenu pm_err_tests
         AllowAutoDeactivate=   True
         AutoDeactivate  =   "True"
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         InitialValue    =   ""
         Italic          =   False
         Left            =   684
         ListIndex       =   "0"
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         SelectedRowIndex=   -1
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   "0.0"
         TextUnit        =   "0"
         Tooltip         =   ""
         Top             =   56
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   196
      End
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		   
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub get_list_of_buckets()
		  
		  
		  var s3_host as new AWS_S3_Host(AWS_Common_Host.LoadCredentials, DefaultTraceMode)
		  
		  var s3_request  as new AWS_S3_ListBuckets()
		  
		  var list_of_buckets() as AWS_S3_item = s3_request.SendRequest(s3_host)
		  
		  TextArea1.text = s3_request.ReplyText
		  
		  if s3_request.ErrorInfo = nil then
		    label1.Text = ""
		    label2.Text = ""
		    
		  else
		    label1.text = s3_request.ErrorInfo.Code
		    label2.text = s3_request.ErrorInfo.Message
		    
		  end if
		  
		  lb_buckets.RemoveAllRows
		  lb_buckets.ColumnCount =2
		  
		  for each item as AWS_S3_item in list_of_buckets
		    lb_buckets.AddRow item.name
		    
		    try
		      lb_buckets.CellTextAt(lb_buckets.LastRowIndex, 1) = item.CreationDate.SQLDateTime
		    catch
		      lb_buckets.CellTextAt(lb_buckets.LastRowIndex, 1) = "-"
		      
		    end try
		    
		  next
		  
		  if lb_buckets.RowCount > 0 then
		    lb_buckets.SelectedRowIndex = 0
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_long_object_text() As string
		  // 
		  // load sample data
		  //
		  
		  var txt_buffer as string = myfile3_10K_tab
		  
		  return txt_buffer.ReplaceAll(chr(13),"")
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub get_objects_in_bucket()
		  //
		  // Request objects in a bucket
		  //
		  
		  var selected_bucket as string = get_user_selected_bucket(True)
		  
		  if selected_bucket.Length = 0 then return 
		  
		  lbl_selectedBucket.text = selected_bucket
		  
		  var s3_host as new AWS_S3_Host(AWS_Common_Host.LoadCredentials, DefaultTraceMode)
		  
		  var s3_request as new AWS_S3_ListObjectsInBucket(selected_bucket)
		  
		  var lst() as AWS_S3_item = s3_request.SendRequest(s3_host)
		  
		  
		  if s3_request.ErrorInfo = nil then
		    label1.Text = ""
		    label2.Text = ""
		    
		  else
		    label1.text = s3_request.ErrorInfo.Code
		    label2.text = s3_request.ErrorInfo.Message
		    
		  end if
		  
		  
		  TextArea1.text = s3_request.ReplyText
		  
		  lb_objects.RemoveAllRows
		  lb_objects.ColumnCount =3
		  
		  for each item as AWS_S3_item in lst
		    lb_objects.AddRow item.name
		    try
		      lb_objects.CellTextAt(lb_objects.LastRowIndex, 1) = item.ModificationDate.SQLDateTime
		    catch
		      lb_objects.CellTextAt(lb_objects.LastRowIndex, 1) = "-"
		    end try
		    
		    lb_objects.CellTextAt(lb_objects.LastRowIndex,2) = str(item.Size)
		    
		  next
		  
		  
		  if lb_objects.RowCount > 0 then
		    lb_objects.SelectedRowIndex = 0
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub get_object_content()
		  //
		  // Request an existing object in an existing  bucket
		  //
		  
		  
		  var selected_bucket as string = get_user_selected_bucket(True)
		  
		  if selected_bucket.length = 0 then  return
		  
		  var selected_object as string
		  
		  try
		    selected_object = self.lb_objects.CellTextAt(lb_objects.SelectedRowIndex,0)
		    lbl_selectedObject.text = selected_object
		    
		  Catch
		    lbl_selectedObject.text =  ""
		    MessageBox("Please select an object")
		    return 
		    
		  end try
		  
		  
		  var s3_host as new AWS_S3_Host(AWS_Common_Host.LoadCredentials, DefaultTraceMode)
		  
		  var s3_request as new AWS_S3_GetObject(selected_bucket,selected_object)
		  
		  var tmp as AWS_S3_item = s3_request.SendRequest(s3_host)
		  
		  ta_file_content.text = ""
		  TextArea1.text = ""
		  
		  if s3_request.ErrorInfo = nil then
		    label1.Text = ""
		    label2.Text = ""
		    ta_file_content.text = tmp.Content
		    
		  else
		    label1.text = s3_request.ErrorInfo.Code
		    label2.text = s3_request.ErrorInfo.Message
		    TextArea1.text = s3_request.ReplyText
		    
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_short_object_text() As string
		  // 
		  // load sample data
		  //
		  //return ""
		  return "Un petit train"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get_user_selected_bucket(showWarning as Boolean) As string
		  var ret as string  
		  
		  try
		    ret = self.lb_buckets.CellTextAt(lb_buckets.SelectedRowIndex,0)
		    
		  catch
		    ret = ""
		  end try
		  
		  
		  if ret.length = 0 and showWarning then
		    MessageBox("Please select a bucket")
		    
		  end if
		  
		  return ret
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub test_get_content()
		  //
		  // Request an existing object in an existing  bucket
		  //
		  var s3_host as new AWS_S3_Host(AWS_Common_Host.LoadCredentials, DefaultTraceMode)
		  
		  var s3_request as new AWS_S3_GetObject(DefaultBucket,DefaultObjectName)
		  
		  var tmp as AWS_S3_item = s3_request.SendRequest(s3_host)
		  
		  ta_file_content.text = ""
		  TextArea1.text = ""
		  
		  if s3_request.ErrorInfo = nil then
		    label1.Text = ""
		    label2.Text = ""
		    ta_file_content.text = tmp.Content
		    
		  else
		    label1.text = s3_request.ErrorInfo.Code
		    label2.text = s3_request.ErrorInfo.Message
		    TextArea1.text = s3_request.ReplyText
		    
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub test_get_list_buckets()
		  
		  
		  var s3_host as new AWS_S3_Host(AWS_Common_Host.LoadCredentials, DefaultTraceMode)
		  
		  var s3_request  as new AWS_S3_ListBuckets()
		  
		  var list_of_buckets() as AWS_S3_item = s3_request.SendRequest(s3_host)
		  
		  TextArea1.text = s3_request.ReplyText
		  
		  if s3_request.ErrorInfo = nil then
		    label1.Text = ""
		    label2.Text = ""
		    
		  else
		    label1.text = s3_request.ErrorInfo.Code
		    label2.text = s3_request.ErrorInfo.Message
		    
		  end if
		  
		  lb_buckets.RemoveAllRows
		  lb_buckets.ColumnCount =2
		  
		  for each item as AWS_S3_item in list_of_buckets
		    lb_buckets.AddRow item.name
		    try
		      lb_buckets.CellTextAt(lb_buckets.LastRowIndex, 1) = item.CreationDate.SQLDateTime
		    catch
		      lb_buckets.CellTextAt(lb_buckets.LastRowIndex, 1) = "-"
		      
		    end try
		    
		  next
		  
		  if lb_buckets.RowCount > 0 then
		    lb_buckets.SelectedRowIndex = 0
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub test_get_objects_err()
		  //
		  // Request objects in a non existant bucket
		  //
		  var s3_host as new AWS_S3_Host(AWS_Common_Host.LoadCredentials, DefaultTraceMode)
		  
		  var s3_request as new AWS_S3_ListObjectsInBucket("sl58-aws-bucket-001xx")
		  
		  var lst() as AWS_S3_item = s3_request.SendRequest(s3_host)
		  
		  
		  if s3_request.ErrorInfo = nil then
		    label1.Text = ""
		    label2.Text = ""
		    
		  else
		    label1.text = s3_request.ErrorInfo.Code
		    label2.text = s3_request.ErrorInfo.Message
		    
		  end if
		  
		  TextArea1.text = s3_request.ReplyText
		  
		  lb_objects.RemoveAllRows
		  lb_objects.ColumnCount =3
		  
		  for each item as AWS_S3_item in lst
		    lb_objects.AddRow item.name
		    try
		      lb_objects.CellTextAt(lb_objects.LastRowIndex, 1) = item.ModificationDate.SQLDateTime
		    catch
		      lb_objects.CellTextAt(lb_objects.LastRowIndex, 1) = "-"
		    end try
		    
		    lb_objects.CellTextAt(lb_objects.LastRowIndex,2) = str(item.Size)
		    
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub test_get_objects_in_bucket()
		  //
		  // Request objects in a bucket
		  //
		  var s3_host as new AWS_S3_Host(AWS_Common_Host.LoadCredentials, DefaultTraceMode)
		  
		  var s3_request as new AWS_S3_ListObjectsInBucket(DefaultBucket)
		  
		  var lst() as AWS_S3_item = s3_request.SendRequest(s3_host)
		  
		  
		  if s3_request.ErrorInfo = nil then
		    label1.Text = ""
		    label2.Text = ""
		    
		  else
		    label1.text = s3_request.ErrorInfo.Code
		    label2.text = s3_request.ErrorInfo.Message
		    
		  end if
		  
		  
		  TextArea1.text = s3_request.ReplyText
		  
		  lb_objects.RemoveAllRows
		  lb_objects.ColumnCount =3
		  
		  for each item as AWS_S3_item in lst
		    lb_objects.AddRow item.name
		    try
		      lb_objects.CellTextAt(lb_objects.LastRowIndex, 1) = item.ModificationDate.SQLDateTime
		    catch
		      lb_objects.CellTextAt(lb_objects.LastRowIndex, 1) = "-"
		    end try
		    
		    lb_objects.CellTextAt(lb_objects.LastRowIndex,2) = str(item.Size)
		    
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub test_get_object_err_1()
		  //
		  // Request a non existing object in an existing  bucket
		  //
		  var s3_host as new AWS_S3_Host(AWS_Common_Host.LoadCredentials, DefaultTraceMode)
		  
		  var s3_request as new AWS_S3_GetObject("sl58-aws-bucket-001","I2C/i2c.hxyz")
		  
		  var tmp as AWS_S3_item = s3_request.SendRequest(s3_host)
		  
		  TextArea1.text = ""
		  
		  if s3_request.ErrorInfo = nil then
		    label1.Text = ""
		    label2.Text = ""
		    TextArea1.text = tmp.Content
		    
		  else
		    label1.text = s3_request.ErrorInfo.Code
		    label2.text = s3_request.ErrorInfo.Message
		    TextArea1.text = s3_request.ReplyText
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub test_get_object_err_2()
		  //
		  // Request an object in a non existing  bucket
		  //
		  var s3_host as new AWS_S3_Host(AWS_Common_Host.LoadCredentials, DefaultTraceMode)
		  
		  var s3_request as new AWS_S3_GetObject("sl58-aws-bucket-001xyz","I2C/i2c.h")
		  
		  var tmp as AWS_S3_item = s3_request.SendRequest(s3_host)
		  
		  TextArea1.text = ""
		  
		  if s3_request.ErrorInfo = nil then
		    label1.Text = ""
		    label2.Text = ""
		    TextArea1.text = tmp.Content
		    
		  else
		    label1.text = s3_request.ErrorInfo.Code
		    label2.text = s3_request.ErrorInfo.Message
		    TextArea1.text = s3_request.ReplyText
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub test_put_long_object()
		  //
		  // Put a long object in a bucket
		  //
		  
		  var ObjText as string = get_long_object_text
		  var ObjName as string = "longObjects/MyObject-" +DateTime.Now.SQLDateTime
		  
		  
		  var s3_host as new AWS_S3_Host(AWS_Common_Host.LoadCredentials, DefaultTraceMode)
		  
		  var s3_request as new AWS_S3_PutObject(DefaultBucket, new AWS_S3_item(ObjName, ObjText))
		  
		  
		  var ret_status as string  = s3_request.SendRequest(s3_host)
		  
		  
		  if s3_request.ErrorInfo = nil then
		    label1.Text = ""
		    label2.Text = ""
		    
		  else
		    label1.text = s3_request.ErrorInfo.Code
		    label2.text = s3_request.ErrorInfo.Message
		    
		  end if
		  
		  
		  TextArea1.text =  ret_status
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub test_put_short_object()
		  //
		  // Put a short object in a bucket
		  //
		  
		  var ObjText as string = get_short_object_text()
		  var ObjName as string = "shortObjects/MyObject-" +DateTime.Now.SQLDateTime
		  
		  
		  var s3_host as new AWS_S3_Host(AWS_Common_Host.LoadCredentials, DefaultTraceMode)
		  
		  var s3_request as new AWS_S3_PutObject(DefaultBucket, new AWS_S3_item(ObjName, ObjText))
		  
		  
		  var ret_status as string  = s3_request.SendRequest(s3_host)
		  
		  
		  if s3_request.ErrorInfo = nil then
		    label1.Text = ""
		    label2.Text = ""
		    
		  else
		    label1.text = s3_request.ErrorInfo.Code
		    label2.text = s3_request.ErrorInfo.Message
		    
		  end if
		  
		  
		  TextArea1.text =  ret_status
		  
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = DefaultBucket, Type = String, Dynamic = False, Default = \"sl58-aws-bucket-001", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DefaultObjectName, Type = String, Dynamic = False, Default = \"I2C/i2c.h", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DefaultTraceMode, Type = Boolean, Dynamic = False, Default = \"True", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events pb_get_buckets
	#tag Event
		Sub Pressed()
		  get_list_of_buckets
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pb_objects_in_bucket
	#tag Event
		Sub Pressed()
		  get_objects_in_bucket
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pb_get_content
	#tag Event
		Sub Pressed()
		  get_object_content
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pb_save_object
	#tag Event
		Sub Pressed()
		  //
		  // Request objects in a bucket
		  //
		  
		  var fs as FolderItem = GetOpenFolderItem("")
		  var tt as TextInputStream
		  
		  if fs = nil then return 
		  
		  if fs.IsFolder then 
		    MessageBox("Please select a flle, not a folder.")
		    return 
		  end if
		  
		  var selected_bucket as string
		  
		  try
		    selected_bucket = self.lb_buckets.CellTextAt(lb_buckets.SelectedRowIndex,0)
		    lbl_selectedBucket.text = selected_bucket
		    
		  Catch
		    lbl_selectedBucket.text =  ""
		    MessageBox("Please select a bucket")
		    return 
		    
		  end try
		  
		  
		  
		  tt = TextInputStream.Open(fs)
		  
		  var objName as string = "savedObjects/" + fs.Name
		  var ObjText as string = tt.ReadAll
		  
		  tt.close
		  
		  
		  
		  var s3_host as new AWS_S3_Host(AWS_Common_Host.LoadCredentials, DefaultTraceMode)
		  
		  var s3_request as new AWS_S3_PutObject(selected_bucket, new AWS_S3_item(ObjName, ObjText))
		  
		  var ret_status as string  = s3_request.SendRequest(s3_host)
		  
		  
		  if s3_request.ErrorInfo = nil then
		    label1.Text = ""
		    label2.Text = ""
		    
		  else
		    label1.text = s3_request.ErrorInfo.Code
		    label2.text = s3_request.ErrorInfo.Message
		    
		  end if
		  
		  
		  TextArea1.text =  ret_status
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pb_run_ok_test
	#tag Event
		Sub Pressed()
		  
		  var i as integer = pm_ok_tests.SelectedRowIndex
		  
		  TextArea1.Text = ""
		  TextArea1.Refresh(True)
		  
		  select case i
		    
		  case 0
		    test_get_list_buckets
		    
		  case 1
		    test_get_objects_in_bucket
		    
		  case 2
		    test_get_content
		    
		  case 3
		    test_put_short_object
		    
		  case 4 
		    test_put_long_object
		    
		  case else
		    
		  end select
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pb_run_err_test
	#tag Event
		Sub Pressed()
		  
		  var i as integer = pm_err_tests.SelectedRowIndex
		  
		  TextArea1.Text = ""
		  TextArea1.Refresh(True)
		  
		  select case i
		    
		  case 0
		    test_get_objects_err
		    
		  case 1
		    test_get_object_err_1
		    
		  case 2
		    test_get_object_err_2
		    
		  case else
		    
		  end select
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pm_ok_tests
	#tag Event
		Sub Opening()
		  
		  
		  me.RemoveAllRows
		  me.AddRow("Get list of buckets")
		  me.AddRow("Get list of objects in bucket")
		  me.AddRow("Get content")
		  me.AddRow("Put short object")
		  me.AddRow("Put long object")
		  
		  me.SelectedRowIndex = 0
		  
		  Return
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pm_err_tests
	#tag Event
		Sub Opening()
		  
		  
		  me.RemoveAllRows
		  me.AddRow("Get objects (err)")
		  me.AddRow("Get one object err 1")
		  me.AddRow("Get one object err 2")
		  
		  me.SelectedRowIndex = 0
		  
		  Return
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="HasTitleBar"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
